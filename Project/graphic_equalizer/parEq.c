#define S_FUNCTION_NAME  parEq
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"
#include <math.h>

static void mdlInitializeSizes(SimStruct *S)
{
    ssSetNumSFcnParams(S, 0);  /* Number of expected parameters */
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) {
        return;
    }

    ssSetNumContStates(S, 0);
    ssSetNumDiscStates(S, 0);

    /* Set Input Port Properties */
    if (!ssSetNumInputPorts(S, 5)) return;  /*5 Input Ports: G0, G, GB, w0, Dw */
    
    ssSetInputPortWidth(S, 0, 1);
    ssSetInputPortWidth(S, 1, 1);
    ssSetInputPortWidth(S, 2, 1);
    ssSetInputPortWidth(S, 3, 1);
    ssSetInputPortWidth(S, 4, 1);
    
    ssSetInputPortDirectFeedThrough(S, 0, 1);
    ssSetInputPortDirectFeedThrough(S, 1, 1);
    ssSetInputPortDirectFeedThrough(S, 2, 1);
    ssSetInputPortDirectFeedThrough(S, 3, 1);
    ssSetInputPortDirectFeedThrough(S, 4, 1);
    
     /* Set Output Port Properties */
    if (!ssSetNumOutputPorts(S, 2)) return;

    ssSetOutputPortWidth(S, 0, 3);
    ssSetOutputPortWidth(S, 1, 3);

    ssSetNumSampleTimes(S, 1);

 ssSetOptions(S,SS_OPTION_WORKS_WITH_CODE_REUSE | SS_OPTION_EXCEPTION_FREE_CODE | SS_OPTION_USE_TLC_WITH_ACCELERATOR);
    
}

static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, 0.0);

}

static void mdlOutputs(SimStruct *S, int_T tid)
{
    double beta, x1, x2, x3, y1, t;
    InputRealPtrsType G0 =  ssGetInputPortRealSignalPtrs(S,0);
    InputRealPtrsType G  =  ssGetInputPortRealSignalPtrs(S,1);
    InputRealPtrsType GB =  ssGetInputPortRealSignalPtrs(S,2);
    InputRealPtrsType w0 =  ssGetInputPortRealSignalPtrs(S,3);
    InputRealPtrsType Dw =  ssGetInputPortRealSignalPtrs(S,4);
    
    real_T       *Num = ssGetOutputPortRealSignal(S,0);
    real_T       *Den = ssGetOutputPortRealSignal(S,1);
    
    
    x1 = pow((*GB[0]),2);
    x2 = pow((*G0[0]),2);
    x3 = pow((*G[0]),2);
    t = tan(*Dw[0]/2);
 
    y1 = sqrt((x1-x2)/(x3-x1));
    beta =  y1 * t;
    
    Num[0] = (*G0[0]+*G[0]*beta)/(1+beta);
    Num[1] =  -(2**G0[0]*cos(*w0[0]))/(1+beta) ;
    Num[2] = (*G0[0]-*G[0]*beta)/(1+beta);
 
    Den[0] = 1;
    Den[1] = -(2*cos(*w0[0]))/(1+beta);
    Den[2] = (1-beta)/(1+beta);
    
}


/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{
}


#ifdef  MATLAB_MEX_FILE    /* Is this file being compiled as a MEX-file? */
#include "simulink.c"      /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"       /* Code generation registration function */
#endif

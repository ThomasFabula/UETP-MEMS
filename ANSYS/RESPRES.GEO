/COM *********************************************************
/COM
/COM File: RESPRES.GEO 
/COM
/COM *********************************************************
/COM Resonant diaphragm pressure sensor in (100)-silicon
/COM *********************************************************

/PREP7            ! enter Pre-processor
/TITLE, Resonant diaphragm pressure sensor

/COM ******* material properties for Si(110)
/COM
EMOD=1.689e5      ! Young's modulus [N/mm2]
POIS=0.064        ! Poisson's ratio
RHO=2.329E-9      ! material density [kg/mm3]
DICK=.025         ! diaphragm thickness [mm]
LANG=9.20         ! diaphragm side length [mm]
XANZ=10           ! number of elements along diaphragm side
ELTY=43           ! element type: SHELL43
XINC=LANG/XANZ    ! element size [mm]

/COM ******** assign material properties
/COM
MP,EX,1,EMOD      ! assign Young's modulus
MP,NUXY,1,POIS    ! assign Poisson's  ratio
MP,DENS,1,RHO     ! assign material density
R,1,DICK          ! assign diaphragm thickness

/COM ******** definition of nodes 
/COM
n,1               ! define first node at origin
n,xanz+1,lang     ! define node at diphragm length 
fill              ! fill nodes between first and last node
ngen,xanz+1,xanz+1,all,,,,xinc ! generate nodes

/COM ******** definition of elements
/COM
ET,1,ELTY            ! choose element type
e,1,2,xanz+3,xanz+2  ! define first element
egen,xanz,1,all      ! generate one element line
egen,xanz,xanz+1,all ! copy element line

/COM ******** definition of boundary conditions
nsel,s,loc,x            ! select nodes on y-axis
nsel,a,loc,y            ! select nodes on x-axis
nsel,a,loc,x,LANG       ! additional selection of nodes
nsel,a,loc,y,LANG
d,all,all         ! all DOFs of selected nodes are set to zero
ALLSEL            ! reselect all nodes, elements, ... 
WSORT             ! optimize wavefront by renumbering

/COM ******** options for graphic display
/view,1,1,1,1     ! define view
/pbc,all,1        ! plot all boundary conditions
save              ! save model data for further RESUME

/COM ******************************************************************
/COM read analysis files with following commands:
/COM
/COM   /INP,RESP-K0,ANL : for STATIC ANALYSIS     or
/COM
/COM   /INP,RESP-K2,ANL : for MODAL ANALYSIS      or
/COM
/COM   /INP,RESP-K6,ANL : for HARMONIC ANALYSIS
/COM
/COM ****************************************************************** 


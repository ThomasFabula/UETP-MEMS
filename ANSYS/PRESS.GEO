/COM *********************************************************
/COM
/COM File: PRESS.GEO
/COM
/COM *********************************************************
/COM
/PREP7               ! enters the preprocessor
/COM
/COM **********************************************************
/COM Cross-section of a piezoresistive pressure sensor
/COM **********************************************************
/COM
/COM Model based on 2-D solid elements with 8 nodes
/COM
/TITLE, Piezoresistive pressure sensor (2-D modeling)
/COM
/COM --------- Definition of analysis type with special options
/COM
antype,static        ! static analysis
nlgeom,on            ! large deflection option
sstif,on             ! stress stiffening option
nsubst,10,10         ! defines number of iterations and
outres,all,10        ! output controls
cnvtol,u             ! use displacement convergence criteria
/COM
/COM ------- Definition of analysis type with special options
/COM
/pbc,all,1           ! all boundary conditions will be displayed
/PNUM,KPOI,1         ! show numbered keypoints
/PNUM,LINE,1         ! show numbered lines
/PNUM,AREA,1         ! show numbered areas
/COM
/COM -------------- Parameters for definition of keypoints
/COM
frax=frax+(diey-memy)/1.41    ! x-dimension on top of the frame
x6= (diey - memy)/1.41 + memx ! x-coordinate of keypoint 6
/COM
/COM -------------- Isotropic material properties of silicon
/COM                   based on <110>-direction
/COM
MP,EX,1,SIYO       ! Young's modulus of material no. 1 = "SIYO"
MP,NUXY,1,SIPO     ! Poisson's ratio  "     "     "  " = "SIPO"
/COM
/COM ----------------------------- End of parameter definitions
/COM
/COM ***************************************** solid modeling
/COM
/COM ----------------- Generation of keypoints, areas and lines
/COM
k,1,0,0               ! keypoints are defined ...
k,2,memx,0
k,3,memx+frax,0
k,4,0,-memy
k,5,memx,-memy
k,6,memx+frax,-memy
k,7,x6,-diey
k,8,memx+frax,-diey
/COM
A,1,4,5,2              ! generates an area through four existing
                       ! keypoints: 1,4,5,2
A,2,5,6,3
A,5,7,8,6
/COM
/COM ------------------- Generation of line divisions
/COM
lesize,2,,,mdix           ! "mdix" divisions along line 2
lesize,4,,,mdix           ! a.s.o.
lesize,1,,,mdiy
lesize,3,,,mdiy
lesize,6,,,mdiy
lesize,5,,,fdix,3
lesize,7,,,fdix,0.33
lesize,9,,,fdix
lesize,8,,,fdiy,3
lesize,10,,,fdiy,0.33
/COM
/COM ------------------- Meshing of the areas
/COM
ET,1,82,,,2            ! defines the element type:
                       ! 2-D 8-node solid (STIF82), arbitrary
                       ! reference number of this element type
                       ! is 1, ",,,2" defines plane strain
                       ! (Z-strain = 0)
amesh,all              ! meshing of all defined areas
/COM
/COM ------------------- Definition of boundary conditions
/COM
nsel,s,loc,x           ! defines symmetry displacement boundary
dsymm,symm,x           ! conditions on the surface of nodes
                       ! normal to the x-axis
/COM
nsel,s,loc,y,-diey           ! selects all nodes on bottom of the
                       ! silicon frame
d,all,all              ! all nodal degrees of freedom are
                       ! restricted for the selected nodes
allsel                 ! reselect all nodes, elements, ...
/COM
/COM ------------------ Definition of loads
/COM
sfl,2,pres,PRES        ! defines line segment 2 as a pressure
                       ! surface, pressure value = "PRES"
                       ! [force/area units]
sfl,8,pres,PRES        ! the same for line segment 5
/COM
eplo,ext               ! displays all the exterior elements of
                       ! the FE-model
/COM
/COM **********************************************************
/COM
/COM Before the preprocessing phase is finished you can look
/COM for some model properties, like keypoints, lines, areas,
/COM volumes (geometric model) or elements, nodes (FE-model)
/COM using some available graphic commands. A few helpful
/COM commands you will find in the seperately distributed
/COM command appendix.
/COM
/COM Next step: The preprocessing phase will be finished and
/COM            the solution phase have to be started using
/COM            the following command sequence:
/COM
/COM         ***********************************************
/COM         *  fini    ! Preprocessing phase is finished  *
/COM         *  /solu   ! Entering the solution mode       *
/COM         *  solve   ! Start the solution               *
/COM         ***********************************************
/COM
/COM The solution phase will stop with the last line "LOPTS-INP".
/COM Now, the equilibrium equations are solved and the solution
/COM phase can be finished with the following input:
/COM
/COM                    **********
/COM                    *  fini  *
/COM                    **********
/COM
/COM Returned to the "BEGIN-level", you will entry the
/COM postprocessing using the predefined macro "PRESS.POS":
/COM
/COM                    ********************
/COM                    *  /inp,press,pos  *
/COM                    ********************
/COM
/COM **********************************************************

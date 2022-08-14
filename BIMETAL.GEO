/COM **********************************************************
/COM
/COM File: BIMETAL.GEO
/COM
/COM **********************************************************
/COM
/COM **********************************************************
/COM Cross-section of a thermally activated bimetal switch
/COM **********************************************************
/COM
/COM Model based on 2-D solid elements with 8 nodes
/COM
/TITLE, Thermally activated bimetal switch (2-D modeling)
/COM
/COM ------- Definition of some graphic options
/COM
/pbc,all,1          ! all boundary conditions will be displayed
/PNUM,KPOI,1        ! show keypoint numbers
/PNUM,LINE,1        ! show line numbers
/PNUM,AREA,1        ! show area numbers
/PNUM,MAT,1         ! show material numbers
/COM
/COM -------------- Parameters for definition of keypoints
/COM
frax=frax+(diey-beay)/1.41    ! x-dimension on top of the frame
x6= (diey - beay)/1.41 + beax ! x-coordinate of keypoint 6
/COM
/COM ------------------------------ End of parameter definitions
/COM
/COM ***************************************** solid modeling
/COM
/COM ------------------- Generation of keypoints, areas and lines
/COM
k,1,0,0               ! keypoints are defined ...
k,2,beax,0
k,3,beax+frax,0
k,4,0,-beay
k,5,beax,-beay
k,6,beax+frax,-beay
k,7,x6,-diey
k,8,beax+frax,-diey
k,9,beax,lay
k,10,0,lay
/COM
A,1,4,5,2              ! generates an area through three or
                       ! four existing keypoints: 1,4,5,2
A,2,5,6,3
A,5,7,8,6
A,1,2,9,10             ! cross-section of the bimetal layer
/COM
/COM ------------------- Generation of line divisions
/COM
lesize,2,,,bdix           ! "bdix" divisions along line 2
lesize,4,,,bdix           ! a.s.o.
lesize,1,,,bdiy
lesize,3,,,bdiy
lesize,6,,,bdiy
lesize,5,,,fdix,3
lesize,7,,,fdix,0.33
lesize,9,,,fdix
lesize,8,,,fdiy,3
lesize,10,,,fdiy,0.33
lesize,11,,,ldiy
lesize,13,,,ldiy
lesize,12,,,bdix
/COM
/COM ------------------- Meshing of the areas
/COM
ET,1,SOLID82,,,2            ! defines the element type:
                       ! 2-D 8-node solid (SOLID82), arbitrary
                       ! reference number of this element type
                       ! is 1, ",,,2" defines plane strain
                       ! (Z-strain = 0)
MAT,1                  ! assigns material number 1 to
                       ! subsequently defined elements
amesh,1,3              ! meshing of the areas 1 to 3 (silicon)
MAT,2                  ! assigns material number 2 to
                       ! subsequently defined elements
amesh,4                ! meshing of the aluminium layer
numm,all
/COM
/COM ------------------- Definition of boundary conditions
/COM
TUNIF,TARB             ! assigns "TARB" to all nodes as uniform
                       ! temperature
/COM
nsel,s,loc,y,-diey     ! selects all nodes on bottom of the
                       ! silicon frame
d,all,all,,,,1         ! all nodal degrees of freedom are
                       ! restricted
                       ! for the selected nodes
alls                   ! reselect all nodes, elements, keypoints, ...
/COM
/COM ------------------ Definition of thermal loads
/COM
TREF,298             ! defines reference temperature for
                     ! thermal expansion: 298 Kelvin
TUNIF,TDIV+298       ! assigns "TDIV+298" Kelvin to all
                     ! nodes as uniform temperature
/COM
eplo,ext             ! displays all the exterior elements of
                     ! the FE-model
/COM
/COM **********************************************************
/COM Before the preprocessing phase is finished you can
/COM look for some model properties, like keypoints, lines,
/COM areas, volumes (geometric model) or elements, nodes
/COM (FE-model) using some available graphic commands. A few
/COM helpful commands you will find in the seperately
/COM distributed command appendix.
/COM
/COM
/COM Next step: The preprocessing phase will be finished and
/COM            the solution phase have to be started using the
/COM            following command sequence:
/COM
/COM          ***********************************************
/COM          *  fini    ! Preprocessing phase is finished  *
/COM          *  /SOLU   ! Enter the solution mode          *
/COM          *  solve   ! Start the solution               *
/COM          ***********************************************
/COM
/COM The solution phase will stop with the last line.
/COM Now, the equilibrium equations are solved
/COM and the solution phase can be finished with the
/COM following input:
/COM
/COM                            **********
/COM                            *  fini  *
/COM                            **********
/COM
/COM Returned to the "BEGIN-level", you will entry the
/COM postprocessing using the predefined macro "BIMETAL.POS":
/COM
/COM                       ********************
/COM                       * /inp,bimetal,pos *
/COM                       ********************
/COM
/COM **********************************************************

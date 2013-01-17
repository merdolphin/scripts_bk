#!/bin/bash

for i in {0..107}

do

#more scount_$i.xvg | sed '/^[#@]/d' | awk '{print $4+$5}' > temp_$i

more scount_$i.xvg | sed '/^[#@]/d' | awk '{if(NF==10) {print $8+$9} ; if(NF==11){print $8+$9+$10}}' > temp_$i



more temp_$i | awk 'BEGIN{ave=0}{ave+=$0}END{print ave/10002}' > ave_$i

done


paste temp_0 temp_1 temp_2 temp_3 temp_4 temp_5 temp_6 temp_7 temp_8 temp_9 temp_10 temp_11 temp_12 temp_13 temp_14 temp_15 temp_16 temp_17 temp_18 temp_19 temp_20 temp_21 temp_22 temp_23 temp_24 temp_25 temp_26 temp_27 temp_28 temp_29 temp_30 temp_31 temp_32 temp_33 temp_34 temp_35 temp_36 temp_37 temp_38 temp_39 temp_40 temp_41 temp_42 temp_43 temp_44 temp_45 temp_46 temp_47 temp_48 temp_49 temp_50 temp_51 temp_52 temp_53 temp_54 temp_55 temp_56 temp_57 temp_58 temp_59 temp_60 temp_61 temp_62 temp_63 temp_64 temp_65 temp_66 temp_67 temp_68 temp_69 temp_70 temp_71 temp_72 temp_73 temp_74 temp_75 temp_76 temp_77 temp_78 temp_79 temp_80 temp_81 temp_82 temp_83 temp_84 temp_85 temp_86 temp_87 temp_88 temp_89 temp_90 temp_91 temp_92 temp_93 temp_94 temp_95 temp_96 temp_97 temp_98 temp_99 temp_100 temp_101 temp_102 temp_103 temp_104 temp_105 temp_106 temp_107 > all_alpha


paste ave_0 ave_1 ave_2 ave_3 ave_4 ave_5 ave_6 ave_7 ave_8 ave_9 ave_10 ave_11 ave_12 ave_13 ave_14 ave_15 ave_16 ave_17 ave_18 ave_19 ave_20 ave_21 ave_22 ave_23 ave_24 ave_25 ave_26 ave_27 ave_28 ave_29 ave_30 ave_31 ave_32 ave_33 ave_34 ave_35 ave_36 ave_37 ave_38 ave_39 ave_40 ave_41 ave_42 ave_43 ave_44 ave_45 ave_46 ave_47 ave_48 ave_49 ave_50 ave_51 ave_52 ave_53 ave_54 ave_55 ave_56 ave_57 ave_58 ave_59 ave_60 ave_61 ave_62 ave_63 ave_64 ave_65 ave_66 ave_67 ave_68 ave_69 ave_70 ave_71 ave_72 ave_73 ave_74 ave_75 ave_76 ave_77 ave_78 ave_79 ave_80 ave_81 ave_82 ave_83 ave_84 ave_85 ave_86 ave_87 ave_88 ave_89 ave_90 ave_91 ave_92 ave_93 ave_94 ave_95 ave_96 ave_97 ave_98 ave_99 ave_100 ave_101 ave_102 ave_103 ave_104 ave_105 ave_106 ave_107 > sc_average_alpha



rm temp_* ave_*

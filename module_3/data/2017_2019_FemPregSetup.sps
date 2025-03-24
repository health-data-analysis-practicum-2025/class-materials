* Encoding: windows-1252.
*-------------------------------------------------------------------------*
*                                                                          
*            NATIONAL SURVEY OF FAMILY GROWTH (NSFG), 2017-2019
*
*                      SPSS Pregnancy Data Setup File
*
*
*  SPSS setup sections are provided for the ASCII version of this data
*  collection.  These sections are listed below:
*
*  DATA LIST:  assigns the name, type, decimal specification (if any),
*  and specifies the beginning and ending column locations for each
*  variable in the data file. Users must replace the "data-filename"
*  in the DATA LIST statement with a filename specifying the directory
*  on the user's computer system in which the downloaded and unzipped
*  data file is physically located (e.g., "c:\temp\data.dat").
*
*  VARIABLE LABELS:  assigns descriptive labels to all variables.
*  Labels and variable names may be identical for some data files.
*
*  VALUE LABELS: assigns descriptive labels to codes found in the data
*  file.  Not all codes necessarily have assigned value labels.
*
*  CREATING A PERMANENT SPSS DATA FILE: If users wish to create and save
*  an SPSS data file for further analysis using SPSS for Windows, the
*  necessary "SAVE OUTFILE" command is provided in the last line of
*  this file.  To activate the command, users must delete the leading
*  asterisk (*) and replace "spss-filename" with a filename specifying
*  the location on the user's computer system to which the new data file
*  will be saved (e.g., SAVE OUTFILE="c:\spsswin\data\NSFG-datafile.sav").
*
*-------------------------------------------------------------------------.

* SPSS FILE HANDLE AND DATA LIST COMMANDS.

FILE HANDLE DATA / NAME="data-filename" LRECL=251 .

DATA LIST FILE=DATA/
   CASEID 1-5               PREGORDR 6-7             MOSCURRP 8            
   PREGEND1 9               PREGEND2 10              HPAGEEND 11-12        
   KIDAGE 13                HPAGELB 14-15            PAYBIRTH1 16          
   PAYBIRTH2 17             PAYBIRTH3 18             CSECPRIM 19           
   CSECMED1 20              CSECMED2 21              CSECMED3 22           
   CSECMED4 23              CSECMED5 24              CSECPLAN 25           
   PRIORSMK 26              POSTSMKS 27              NPOSTSMK 28           
   ANYNURSE1 29             FEDSOLID1 30             FRSTEATD_N1 31-33     
   FRSTEATD_P1 34           FRSTEATD1 35-36          QUITNURS1 37          
   MDSOLID1 38              WHNSOLID1 39             MDNUTRIT1_1 40        
   MDNUTRIT1_2 41           MDNUTRIT1_3 42           MDNUTRIT1_4 43        
   MDNUTRIT1_5 44           NBRNLV_S 45              ANYUSINT 46           
   EVUSEINT 47              STOPDUSE 48              WHYSTOPD 49           
   WHATMETH01 50-51         WHATMETH02 52-53         WHATMETH03 54-55      
   WHATMETH04 56-57         RESNOUSE 58              WANTBOLD 59           
   PROBBABE 60              CNFRMNO 61               WANTBLD2 62           
   TIMINGOK 63              TOOSOON_N 64-66          TOOSOON_P 67          
   LATERNUM 68-70           LATERMY 71               WTHPART1 72           
   WTHPART2 73              FEELINPG 74-75           HPWNOLD 76            
   TIMOKHP 77               COHPBEG 78               COHPEND 79            
   TELLFATH 80              WHENTELL 81              TRYSCALE 82-83        
   WANTSCAL 84-85           WHYPRG1 86               WHYPRG2 87            
   WHYPRG3 88               WHYNOUSE1 89-90          WHYNOUSE2 91          
   WHYNOUSE3 92             WHYNOUSE4 93             WHYNOUSE5 94          
   WHYNOUSE6 95             WHYNOUSE7 96             WHYNOPG1 97-98        
   WHYNOPG2 99-100          MAINOUSE 101             GEST_LB 102           
   GEST_OTHR 103            GESTIMP 104              OUTCOME 105           
   BIRTHORD 106-107         DATEND 108-111           AGEPREG 112-113       
   DATECON 114-117          AGECON 118-119           FMAROUT5 120          
   PMARPREG 121             RMAROUT6 122             FMARCON5 123          
   RMARCON6 124             LEARNPRG 125             PNCAREWK 126          
   PAYDELIV 127             LBW1 128                 BFEEDWKS 129          
   OLDWANTR 130             OLDWANTP 131             WANTRESP 132          
   WANTPART 133             TOOSOON 134-136          NEWWANTR 137          
   AGER 138-139             AGESCRN 140-141          FMARITAL 142          
   RMARITAL 143             EDUCAT 144-145           HIEDUC 146-147        
   RACE 148                 HISPANIC 149             HISPRACE2 150         
   RCURPREG 151             PREGNUM 152-153          PARITY 154-155        
   CURR_INS 156             PUBASSIS 157             POVERTY 158-160       
   LABORFOR 161             RELIGION 162             METRO 163             
   BRNOUT 164               YRSTRUS 165-166          OUTCOME_I 167         
   BIRTHORD_I 168           DATEND_I 169             AGEPREG_I 170         
   DATECON_I 171            AGECON_I 172             FMAROUT5_I 173        
   PMARPREG_I 174           RMAROUT6_I 175           FMARCON5_I 176        
   RMARCON6_I 177           LEARNPRG_I 178           PNCAREWK_I 179        
   PAYDELIV_I 180           LBW1_I 181               BFEEDWKS_I 182        
   OLDWANTR_I 183           OLDWANTP_I 184           WANTRESP_I 185        
   WANTPART_I 186           TOOSOON_I 187            NEWWANTR_I 188        
   AGER_I 189               FMARITAL_I 190           RMARITAL_I 191        
   EDUCAT_I 192             HIEDUC_I 193             RACE_I 194            
   HISPANIC_I 195           HISPRACE2_I 196          RCURPREG_I 197        
   PREGNUM_I 198            PARITY_I 199             CURR_INS_I 200        
   PUBASSIS_I 201           POVERTY_I 202            LABORFOR_I 203        
   RELIGION_I 204           WGT2017_2019 205-220     SECU 221              
   SEST 222-224             CMINTVW 225-228          CMLSTYR 229-232       
   CMJAN3YR 233-236         CMJAN4YR 237-240         CMJAN5YR 241-244      
   QUARTER 245-246          PHASE 247                INTVWYEAR 248-251 .   

* SPSS FORMATS COMMAND.

FORMATS
  WGT2017_2019 (F17.11) / .

* SPSS VARIABLE LABELS COMMAND.

VARIABLE LABELS
   CASEID 'Case identification number'
   PREGORDR 'Pregnancy order (number)'
   MOSCURRP 'Number of Months Currently Pregnant'
   PREGEND1 'BC-1 How Pregnancy Ended - 1st mention'
   PREGEND2 'BC-1 How Pregnancy Ended - 2nd mention'
   HPAGEEND "BC-4c Father's age (categorical) at pregnancy's end date"
   KIDAGE 'Current age (in years) of child(ren) from this pregnancy'
   HPAGELB "BD-6 Father's age (categorical) at time of child(ren) s birth"
   PAYBIRTH1 'BD-8 Payment for delivery - 1st mention'
   PAYBIRTH2 'BD-8 Payment for delivery - 2nd mention'
   PAYBIRTH3 'BD-8 Payment for delivery - 3rd mention'
   CSECPRIM "BD-9 Is this R's first c-section?"
   CSECMED1 'BD-10 Medical reasons reported for this C-section - 1st mention'
   CSECMED2 'BD-10 Medical reasons reported for this C-section - 2nd mention'
   CSECMED3 'BD-10 Medical reasons reported for this C-section - 3rd mention'
   CSECMED4 'BD-10 Medical reasons reported for this C-section - 4th mention'
   CSECMED5 'BD-10 Medical reasons reported for this C-section - 5th mention'
   CSECPLAN 'BD-11 Was this c-section planned for by R?'
   PRIORSMK 'BE-3 Amount R smoked in 6 mos before R knew she was pregnant'
   POSTSMKS 'BE-4 R smoked at all after R knew she was pregnant'
   NPOSTSMK 'BE-5 Amount R smoked during pregnancy after R knew she was preg'
   ANYNURSE1 'BH-1 Whether R breastfed this child at all - 1st from this preg'
   FEDSOLID1    'BH-2 Has R fed this child anything other than breastmilk - 1st fr' +
   'om this preg'
   FRSTEATD_N1    'BH-3 Age (mos/wks/day) when 1st fed non-breastmilk - 1st from thi' +
   's preg'
   FRSTEATD_P1 'BH-3 Units (mos/wks/days) for FRSTEATD_N - 1st from this preg'
   FRSTEATD1 'Age (in mos) when 1st fed non-breastmilk - 1st from this preg'
   QUITNURS1 'BH-4 Has R stopped breastfeeding child - 1st from this preg'
   MDSOLID1    'BH-5a Doctor talked with R about when to feed solid food to this ' +
   'child aged 6 mos-5 yrs old (1st or only from this pregnancy)'
   WHNSOLID1    'BH-5b Age when doctor recommended feeding this child solid foods ' +
   '(1st or only from this pregnancy)'
   MDNUTRIT1_1    'BH-5c Nutrition information given for this child aged 6 mos-5 yrs' +
   ' old (1st mention/1st or only from this preg)'
   MDNUTRIT1_2    'BH-5c Nutrition information given for this child aged 6 mos-5 yrs' +
   ' old (2nd mention/1st or only from this preg)'
   MDNUTRIT1_3    'BH-5c Nutrition information given for this child aged 6 mos-5 yrs' +
   ' old (3rd mention/1st or only from this preg)'
   MDNUTRIT1_4    'BH-5c Nutrition information given for this child aged 6 mos-5 yrs' +
   ' old (4th mention/1st or only from this preg)'
   MDNUTRIT1_5    'BH-5c Nutrition information given for this child aged 6 mos-5 yrs' +
   ' old (5th mention/1st or only from this preg)'
   NBRNLV_S '# of babies born alive from this preg (based on CCSD)'
   ANYUSINT 'Any method use in pregnancy interval'
   EVUSEINT 'EG-1 Use any method in pregnancy interval?'
   STOPDUSE 'EG-2 Before you became preg, stop using all methods?'
   WHYSTOPD 'EG-3 Stop using methods before preg because wanted preg?'
   WHATMETH01 'EG-4 Method(s) using when became preg - 1st mention'
   WHATMETH02 'EG-4 Method(s) using when became preg - 2nd mention'
   WHATMETH03 'EG-4 Method(s) using when became preg - 3rd mention'
   WHATMETH04 'EG-4 Method(s) using when became preg - 4th mention'
   RESNOUSE 'EG-5 Reason not using/had stopped using method bec. wanted preg?'
   WANTBOLD 'EG-6 Right bef preg, want to have baby at any time in future?'
   PROBBABE 'EG-7 probably want baby at any time in future or not?'
   CNFRMNO "EG-8 Verify didn't want baby at any time in future"
   WANTBLD2    'EG-9 Right before preg, want to have baby at any time in future? ' +
   '(2nd asking)'
   TIMINGOK    'EG-10 Become preg too soon, right time, or later than you wanted?'
   TOOSOON_N 'EG-11 How much sooner than wanted became preg (months or years)'
   TOOSOON_P    'EG-11 Choose mons or yrs for how much sooner became preg than wan' +
   'ted'
   LATERNUM 'EG-11c How much later than wanted became preg - number'
   LATERMY 'EG-11d How much later than wanted became preg - unit'
   WTHPART1 'EG-12a Right before preg, want to have baby with that partner?'
   WTHPART2    'EG-12b Right bef. preg, think might ever want to have baby w/that' +
   ' partner?'
   FEELINPG 'EG-13 How happy to be preg. scale (0-10)'
   HPWNOLD    'EG-16 Right bef preg, did the father want R to have baby at any t' +
   'ime in future?'
   TIMOKHP    'EG-17 R became preg sooner, right time, or later than father of p' +
   'reg wanted'
   COHPBEG 'EG-18a Was R living w/father of preg at beginning of preg'
   COHPEND    'EG-18b Was R living w/father of preg when preg ended/baby was bor' +
   'n'
   TELLFATH 'EG-19 Did R tell father of preg that she was pregnant'
   WHENTELL    'EG-20 When did R tell father of preg about pregnancy: during or a' +
   'fter?'
   TRYSCALE 'EG-21 How hard trying to get/avoid pregnancy (0-10 scale)'
   WANTSCAL 'EG-22 How much wanted to get/avoid pregnancy (0-10 scale)'
   WHYPRG1    "EG-23 (unintended preg): method fail or R wasn't using properly-1" +
   "st mention"
   WHYPRG2    "EG-23 (unintended preg): method fail or R wasn't using properly-2" +
   "nd mention"
   WHYPRG3    "EG-23 (unintended preg): method fail or R wasn't using properly-3" +
   "rd mention"
   WHYNOUSE1 "EG-24 (unintended preg) Reason didn't use contraceptn - 1st"
   WHYNOUSE2 "EG-24 (unintended preg) Reason didn't use contraceptn - 2nd"
   WHYNOUSE3 "EG-24 (unintended preg) Reason didn't use contraceptn - 3rd"
   WHYNOUSE4 "EG-24 (unintended preg) Reason didn't use contraceptn - 4th"
   WHYNOUSE5 "EG-24 (unintended preg) Reason didn't use contraceptn - 5th"
   WHYNOUSE6 "EG-24 (unintended preg) Reason didn't use contraceptn - 6th"
   WHYNOUSE7 "EG-24 (unintended preg) Reason didn't use contraceptn - 7th"
   WHYNOPG1    "EG-24aa open-ended response: reason didn't think could get preg -" +
   " 1st"
   WHYNOPG2    "EG-24aa open-ended response: reason didn't think could get preg -" +
   " 2nd"
   MAINOUSE "EG-24a (unintended preg) Main reason didn't use contraception"
   GEST_LB 'Gestational length (if live birth)'
   GEST_OTHR 'Gestational length (if not live birth or current preg)'
   GESTIMP 'GEST_LB or GEST_OTHR var based on imputed gestational length'
   OUTCOME 'Pregnancy outcome'
   BIRTHORD 'Birth order'
   DATEND 'Year pregnancy ended'
   AGEPREG 'Age at pregnancy outcome'
   DATECON 'Year pregnancy began'
   AGECON 'Age at time of conception'
   FMAROUT5 'Formal marital status at pregnancy outcome'
   PMARPREG "Whether pregnancy ended before R's 1st marriage (premaritally)"
   RMAROUT6 'Informal marital status at pregnancy outcome - 6 categories'
   FMARCON5 'Formal marital status at conception - 5 categories'
   RMARCON6 'Informal marital status at conception - 6 categories'
   LEARNPRG 'Number of weeks pregnant when R learned she was pregnant'
   PNCAREWK 'Number of weeks pregnant at first prenatal care'
   PAYDELIV 'Payment for delivery'
   LBW1 'Low birthweight - 1st baby from this preg'
   BFEEDWKS 'Duration of breastfeeding in weeks'
   OLDWANTR 'Wantedness of pregnancy - respondent - Cycle 4 version'
   OLDWANTP    "Wantedness of preg - R's partner (father of pregnancy) - Cycle 4 " +
   "version"
   WANTRESP 'Wantedness of pregnancy -- Respondent (RECODE)'
   WANTPART "Wantedness of pregnancy -- R's partner (RECODE)"
   TOOSOON 'Number of months too soon pregnancy occurred'
   NEWWANTR 'Detailed wantedness of pregnancy - respondent'
   AGER 'Age at interview'
   AGESCRN "R's age at screener"
   FMARITAL 'Formal marital status'
   RMARITAL 'Informal Marital Status'
   EDUCAT 'Education (completed years of schooling)'
   HIEDUC 'Highest completed year of school or degree'
   RACE 'Race'
   HISPANIC 'Hispanic origin'
   HISPRACE2    'Race & Hispanic origin of respondent - 1997 OMB standards (respon' +
   'dent recode)'
   RCURPREG 'Pregnant at time of interview'
   PREGNUM 'CAPI-based total number of pregnancies'
   PARITY 'Total number of live births'
   CURR_INS 'Current health insurance coverage'
   PUBASSIS 'Whether R received public assistance in prior calendar year'
   POVERTY 'Poverty level income'
   LABORFOR 'Labor force status'
   RELIGION 'Current religious affiliation'
   METRO 'Place of residence (Metropolitan / Nonmetropolitan)'
   BRNOUT 'IB-8 R born outside of US'
   YRSTRUS 'Year R came to the United States'
   OUTCOME_I 'OUTCOME Imputation Flag'
   BIRTHORD_I 'BIRTHORD Imputation Flag'
   DATEND_I 'DATEND Imputation Flag'
   AGEPREG_I 'AGEPREG Imputation Flag'
   DATECON_I 'DATECON Imputation Flag'
   AGECON_I 'AGECON Imputation Flag'
   FMAROUT5_I 'FMAROUT5 Imputation Flag'
   PMARPREG_I 'PMARPREG Imputation Flag'
   RMAROUT6_I 'RMAROUT6 Imputation Flag'
   FMARCON5_I 'FMARCON5 Imputation Flag'
   RMARCON6_I 'RMARCON6 Imputation Flag'
   LEARNPRG_I 'LEARNPRG Imputation Flag'
   PNCAREWK_I 'PNCAREWK Imputation Flag'
   PAYDELIV_I 'PAYDELIV Imputation Flag'
   LBW1_I 'LBW1 Imputation Flag'
   BFEEDWKS_I 'BFEEDWKS Imputation Flag'
   OLDWANTR_I 'OLDWANTR Imputation Flag'
   OLDWANTP_I 'OLDWANTP Imputation Flag'
   WANTRESP_I 'WANTRESP Imputation Flag'
   WANTPART_I 'WANTPART Imputation Flag'
   TOOSOON_I 'TOOSOON Imputation Flag'
   NEWWANTR_I 'NEWWANTR Imputation Flag'
   AGER_I 'AGER Imputation Flag'
   FMARITAL_I 'FMARITAL Imputation Flag'
   RMARITAL_I 'RMARITAL Imputation Flag'
   EDUCAT_I 'EDUCAT Imputation Flag'
   HIEDUC_I 'HIEDUC Imputation Flag'
   RACE_I 'RACE Imputation Flag'
   HISPANIC_I 'HISPANIC Imputation Flag'
   HISPRACE2_I 'HISPRACE2 Imputation Flag'
   RCURPREG_I 'RCURPREG Imputation Flag'
   PREGNUM_I 'PREGNUM Imputation Flag'
   PARITY_I 'PARITY Imputation Flag'
   CURR_INS_I 'CURR_INS Imputation Flag'
   PUBASSIS_I 'PUBASSIS Imputation Flag'
   POVERTY_I 'POVERTY Imputation Flag'
   LABORFOR_I 'LABORFOR Imputation Flag'
   RELIGION_I 'RELIGION Imputation Flag'
   WGT2017_2019 'Final weight for the 2017-2019 NSFG'
   SECU 'Randomized version of the sampling error computational unit'
   SEST 'Randomized version of the stratum'
   CMINTVW    'Century month for date of interview  (Computed in Flow Check A-1)'
   CMLSTYR    'Century month for month/year of interview minus one year (Compute' +
   'd in Flow Check A-1)'
   CMJAN3YR    'Century month of January Three Years Prior to Year of interview (' +
   'Computed in Flow Check A-1)'
   CMJAN4YR    'Century month of January Four Years Prior to Year of Interview (C' +
   'omputed in Flow Check A-1)'
   CMJAN5YR    'Century month of January Five Years Prior to Year of Interview (C' +
   'omputed in Flow Check A-1)'
   QUARTER 'Quarter when case was sampled'
   PHASE 'Regular- or double-sample portion of the quarter'
   INTVWYEAR 'Calendar year when interview occurred' .

* SPSS VALUE LABELS COMMAND.

VALUE LABELS
 PREGORDR
     1 '1ST PREGNANCY'
     2 '2ND PREGNANCY'
     3 '3RD PREGNANCY'
     4 '4TH PREGNANCY'
     5 '5TH PREGNANCY'
     6 '6TH PREGNANCY'
     7 '7TH PREGNANCY'
     8 '8TH PREGNANCY'
     9 '9TH PREGNANCY'
     10 '10TH PREGNANCY'
     11 '11TH PREGNANCY'
     12 '12TH PREGNANCY'
     13 '13TH PREGNANCY'
     14 '14TH PREGNANCY'
     15 '15TH PREGNANCY'
     16 '16TH PREGNANCY'
     17 '17TH PREGNANCY'
     18 '18TH PREGNANCY'
     19 '19TH PREGNANCY'
     20 '20TH PREGNANCY' /
 MOSCURRP
     98 'Refused'
     99 "Don't know" /
 PREGEND1 PREGEND2
     1 'Miscarriage'
     2 'Stillbirth'
     3 'Abortion'
     4 'Ectopic or tubal pregnancy'
     5 'Live birth by Cesarean section'
     6 'Live birth by vaginal delivery'
     8 'Refused'
     9 "Don't know" /
 HPAGEEND HPAGELB
     1 'Under 20 years'
     2 '20-24 years'
     3 '25-29 years'
     4 '30-34 years'
     5 '35-39 years'
     6 '40 years or older'
     98 'Refused'
     99 "Don't know" /
 KIDAGE
     0 'Less than 1 year'
     1 '1 year old'
     2 '2 years old'
     3 '3 years old'
     4 '4 years old'
     5 '5 years old'
     6 '6-11 years old'
     7 '12-17 years old'
     8 '18 years or older' /
 PAYBIRTH1 PAYBIRTH2 PAYBIRTH3
     1 'Insurance'
     2 'Co-payment or out-of-pocket payment'
     3 'Medicaid'
     4 'No payment required'
     5 'Some other way'
     8 'Refused'
     9 "Don't know" /
 CSECPRIM CSECPLAN POSTSMKS ANYNURSE1 FEDSOLID1 QUITNURS1 EVUSEINT 
 STOPDUSE WHYSTOPD RESNOUSE COHPBEG COHPEND TELLFATH BRNOUT
     1 'Yes'
     5 'No'
     8 'Refused'
     9 "Don't know" /
 CSECMED1 CSECMED2 CSECMED3 CSECMED4 CSECMED5
     1 'Labor was taking too long'
     2 'Maternity care provider concerned that baby was too big'
     3 'Baby was in the wrong position (e.g, breech)'
     4 'Maternity care provider concerned about your health'
     5 "Maternity care provider concerned about your baby's health"
     6 'Some other medical reason'
     7 'There was no medical reason'
     8 'Refused'
     9 "Don't know" /
 PRIORSMK
     0 'None'
     1 'About one cigarette a day or less'
     2 'Just a few cigarettes a day (2-4)'
     3 'About half a pack a day (5-14)'
     4 'About a pack a day (15-24)'
     5 'About 1 1/2 packs a day (25-34)'
     6 'About 2 packs a day (35-44)'
     7 'More than 2 packs a day (45 or more)'
     8 'Refused'
     9 "Don't know" /
 NPOSTSMK
     1 'About one cigarette a day or less'
     2 'Just a few cigarettes a day (2-4)'
     3 'About half a pack a day (5-14)'
     4 'About a pack a day (15-24)'
     5 'About 1 1/2 packs a day (25-34)'
     6 'About 2 packs a day (35-44)'
     7 'More than 2 packs a day (45 or more)'
     8 'Refused'
     9 "Don't know" /
 FRSTEATD_N1
     998 'Refused'
     999 "Don't know" /
 FRSTEATD_P1
     1 'Months'
     2 'Weeks'
     3 'Days'
     8 'Refused'
     9 "Don't know" /
 FRSTEATD1
     0 'LESS THAN 1 MONTH'
     1 '1 MONTH'
     2 '2 MONTHS'
     3 '3 MONTHS'
     4 '4 MONTHS'
     5 '5 MONTHS'
     6 '6 MONTHS'
     98 'Refused'
     99 "Don't know" /
 MDSOLID1
     1 'YES'
     5 'NO'
     9 "DON'T KNOW" /
 WHNSOLID1
     1 'Before 4 months of age'
     2 '4 to 5 months of age'
     3 '6 months of age or older'
     8 'Refused'
     9 "Don't know" /
 MDNUTRIT1_1 MDNUTRIT1_2 MDNUTRIT1_3 MDNUTRIT1_4 MDNUTRIT1_5
     1 'Offering foods with many different tastes and textures'
     2 "Not forcing child to finish food or bottles, even if not interested or didn't have much"
     3 'Offering a variety of fruits and vegetables'
     4 'Limiting foods and drinks with added sugar (such as candy, cookies, soda, juice)'
     5 'Limiting eating meals in front of tv or other electronic devices'
     6 'None of the above topics'
     8 'Refused'
     9 "Don't know" /
 NBRNLV_S
     1 '1 BABY'
     2 '2 BABIES'
     3 '3 BABIES'
     8 'Refused'
     9 "Don't know" /
 ANYUSINT
     1 'Yes'
     5 'No'
     7 'Not ascertained'
     8 'Refused'
     9 "Don't know" /
 WHATMETH01 WHATMETH02 WHATMETH03 WHATMETH04
     1 'No method used'
     3 'Birth control pills'
     4 'Condom'
     5 "Partner's vasectomy"
     6 'Female sterilizing operation, such as tubal sterilization and hysterectomy'
     7 'Withdrawal, pulling out'
     8 'Depo-Provera, injectables'
     9 'Hormonal implant (Norplant, Implanon, or Nexplanon)'
     10 'Calendar rhythm, Standard Days, or Cycle Beads method'
     11 'Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)'
     12 'Diaphragm'
     13 'Female condom, vaginal pouch'
     14 'Foam'
     15 'Jelly or cream'
     16 'Cervical cap'
     17 'Suppository, insert'
     18 'Today sponge'
     19 'IUD'
     20 'Emergency contraception'
     21 'Other method -- specify'
     22 'Respondent was sterile'
     23 "Respondent's partner was sterile"
     24 'Lunelle injectable (monthly shot)'
     25 'Contraceptive patch (Ortho-Evra or Xulane)'
     26 'Vaginal contraceptive ring'
     98 'Refused'
     99 "Don't know" /
 WANTBOLD
     1 'Yes'
     5 'No'
     6 "Not sure, Don't know"
     8 'Refused'
     9 "Don't know" /
 PROBBABE
     1 'Probably yes'
     5 'Probably not'
     6 "Didn't care"
     8 'Refused'
     9 "Don't know" /
 CNFRMNO
     1 'Correct'
     2 'Incorrect'
     8 'Refused'
     9 "Don't know" /
 WANTBLD2
     1 'Yes'
     5 'No'
     6 "Not sure, Don't know"
     7 "Didn't care"
     8 'Refused'
     9 "Don't know" /
 TIMINGOK TIMOKHP
     1 'Sooner'
     2 'Right time'
     3 'Later'
     4 "Didn't care"
     8 'Refused'
     9 "Don't know" /
 TOOSOON_N
     998 'Refused'
     999 "Don't know" /
 TOOSOON_P
     1 'Months'
     2 'Years'
     8 'Refused'
     9 "Don't know" /
 LATERNUM
     998 'Refused'
     999 "Don't know" /
 LATERMY
     1 'Months'
     2 'Years'
     8 'Refused'
     9 "Don't know" /
 WTHPART1 WTHPART2
     1 'Definitely yes'
     2 'Probably yes'
     3 'Probably no'
     4 'Definitely no'
     8 'Refused'
     9 "Don't know" /
 FEELINPG
     0 'VERY UNHAPPY'
     1 '1'
     2 '2'
     3 '3'
     4 '4'
     5 '5'
     6 '6'
     7 '7'
     8 '8'
     9 '9'
     10 'VERY HAPPY'
     98 'REFUSED'
     99 "DON'T KNOW" /
 HPWNOLD
     1 'Yes'
     5 'No'
     6 "Not sure, Don't know"
     7 'Not ascertained'
     8 'Refused'
     9 "Don't know" /
 WHENTELL
     1 'During the pregnancy'
     2 'After the [pregnancy ended/baby was born]'
     8 'Refused'
     9 "Don't know" /
 TRYSCALE WANTSCAL
     0 '0'
     1 '1'
     2 '2'
     3 '3'
     4 '4'
     5 '5'
     6 '6'
     7 '7'
     8 '8'
     9 '9'
     10 '10'
     98 'Refused'
     99 "Don't know" /
 WHYPRG1 WHYPRG2 WHYPRG3
     1 'Your birth control method failed'
     2 'You did not use your birth control method properly'
     3 "Respondent wasn't using a method"
     8 'Refused'
     9 "Don't know" /
 WHYNOUSE1 WHYNOUSE2 WHYNOUSE3 WHYNOUSE4 WHYNOUSE5 WHYNOUSE6 WHYNOUSE7
     1 'You did not expect to have sex'
     2 'You did not think you could get pregnant'
     3 "You didn't really mind if you got pregnant"
     4 'You were worried about the side effects of birth control'
     5 'Your male partner did not want you to use a birth control method'
     6 'Your male partner himself did not want to use a birth control method'
     7 '(IF VOLUNTEERED:)Respondent was using a method'
     8 'You could not get a method'
     9 'You were not taking, or using, your method consistently'
     98 'Refused'
     99 "Don't know" /
 WHYNOPG1 WHYNOPG2
     1 'Diagnosis of repro problems/condition'
     2 'Prior preg or attempt: problems with or treatments/ART needed'
     3 'Prior unprotected sex, no preg'
     4 "Just didn't think would get preg/misunderstood risk"
     5 "Just didn't think could get preg"
     6 "Don't know why/didn't think about it/naive/mistake"
     7 'Thought method was still working (still in her system)'
     8 'Prior/recent miscarriage(s) or ectopic pregnancy'
     9 'Menstrual cycle problems/irregularity'
     10 'Had recent birth'
     11 'Perceive infertile or difficult getting preg/carrying to term'
     12 'Lack of education/knowledge'
     13 'Endometriosis'
     14 'Age (too old)'
     15 'Breastfeeding'
     16 'Believed partner subfecund/infertile/sterile'
     17 'Withdrawal failed'
     18 'Thought it was safe period in cycle'
     19 'Method failure (pill, condom, tubal, IUD, Depo-Provera)'
     20 'Other'
     97 'Not ascertained'
     98 'Refused'
     99 "Don't know" /
 MAINOUSE
     1 'You did not expect to have sex'
     2 'You did not think you could get pregnant'
     3 "You didn't really mind if you got pregnant"
     4 'You were worried about the side effects of birth control'
     5 'Your male partner did not want you to use a birth control method'
     6 'Your male partner himself did not want to use a birth control method'
     8 'You could not get a method'
     9 'You were not taking, or using, your method consistently'
     98 'Refused'
     99 "Don't know" /
 GEST_LB
     1 'EARLY PRETERM (< 34 WEEKS)'
     2 'PRETERM (34-36 WEEKS)'
     3 'TERM (37-40 WEEKS)'
     4 'POST-TERM (> 40 WEEKS)' /
 GEST_OTHR
     1 '1ST TRIMESTER (0-13 WEEKS)'
     2 '2ND TRIMESTER (14-26 WEEKS)'
     3 '3RD TRIMESTER (> 26 WEEKS)' /
 GESTIMP
     1 'Yes'
     2 'No' /
 OUTCOME
     1 'LIVE BIRTH'
     2 'INDUCED ABORTION'
     3 'STILLBIRTH'
     4 'MISCARRIAGE'
     5 'ECTOPIC PREGNANCY'
     6 'CURRENT PREGNANCY' /
 BIRTHORD
     1 '1ST BIRTH'
     2 '2ND BIRTH'
     3 '3RD BIRTH'
     4 '4TH BIRTH'
     5 '5TH BIRTH'
     6 '6TH BIRTH'
     7 '7TH BIRTH'
     8 '8TH BIRTH'
     9 '9TH BIRTH'
     10 '10TH BIRTH'
     11 '11TH BIRTH'
     12 '12TH BIRTH'
     13 '13TH BIRTH'
     14 '14TH BIRTH' /
 DATEND DATECON
     9997 'Not ascertained'
     9998 'Refused'
     9999 "Don't know" /
 FMAROUT5 FMARCON5
     1 'MARRIED'
     2 'DIVORCED'
     3 'WIDOWED'
     4 'SEPARATED'
     5 'NEVER MARRIED' /
 PMARPREG
     1 'YES'
     2 'No' /
 RMAROUT6 RMARCON6
     1 'MARRIED'
     2 'DIVORCED'
     3 'WIDOWED'
     4 'SEPARATED'
     5 'COHABITING'
     6 'NEVER MARRIED, NOT COHABITING' /
 LEARNPRG
     1 '13 WEEKS OR EARLIER'
     2 '14 WEEKS OR LATER' /
 PNCAREWK
     1 '13 WEEKS OR EARLIER'
     2 '14 WEEKS OR LATER'
     3 'NO PRENATAL CARE FOR THIS PREGNANCY' /
 PAYDELIV
     1 'OWN INCOME ONLY'
     2 'INSURANCE ONLY'
     3 'OWN INCOME & INSURANCE ONLY'
     4 'MEDICAID/GOVT ASSISTANCE MENTIONED AT ALL'
     5 'ALL OTHER COMBINATIONS OF PAYMENT METHODS' /
 LBW1
     1 'YES, LOW BIRTH WEIGHT'
     2 'NO, NOT LOW BIRTH WEIGHT' /
 BFEEDWKS
     0 'Never breastfed this child'
     1 'Breastfed less than 1 week'
     2 'Breastfed 1-13 weeks (LE 3 mos)'
     3 'Breastfed 14-26 weeks (>3/LE 6 mos)'
     4 'Breastfed 27-52 weeks (>6/LE 12 mos)'
     5 'Breastfed 53-104 weeks (>1/LE 2 yrs)'
     6 'Breastfed 105+ weeks (>2 yrs)'
     7 'Still breastfeeding this child' /
 OLDWANTR OLDWANTP WANTRESP WANTPART
     1 'LATER, OVERDUE'
     2 'RIGHT TIME'
     3 'TOO SOON, MISTIMED'
     4 "DIDN'T CARE, INDIFFERENT"
     5 'UNWANTED'
     6 "DON'T KNOW, NOT SURE" /
 TOOSOON
     998 'Refused'
     999 "Don't know" /
 NEWWANTR
     1 'Later, overdue'
     2 'Right time'
     3 'Too soon: by less than 2 years'
     4 'Too soon: by 2 years or more'
     5 "Didn't care, indifferent"
     6 'Unwanted'
     7 "Don't know, not sure" /
 AGER
     15 '15 YEARS'
     16 '16 YEARS'
     17 '17 YEARS'
     18 '18 YEARS'
     19 '19 YEARS'
     20 '20 YEARS'
     21 '21 YEARS'
     22 '22 YEARS'
     23 '23 YEARS'
     24 '24 YEARS'
     25 '25 YEARS'
     26 '26 YEARS'
     27 '27 YEARS'
     28 '28 YEARS'
     29 '29 YEARS'
     30 '30 YEARS'
     31 '31 YEARS'
     32 '32 YEARS'
     33 '33 YEARS'
     34 '34 YEARS'
     35 '35 YEARS'
     36 '36 YEARS'
     37 '37 YEARS'
     38 '38 YEARS'
     39 '39 YEARS'
     40 '40 YEARS'
     41 '41 YEARS'
     42 '42 YEARS'
     43 '43 YEARS'
     44 '44 YEARS'
     45 '45 YEARS'
     46 '46 YEARS'
     47 '47 YEARS'
     48 '48 YEARS' /
 AGESCRN
     15 '15 years'
     16 '16 years'
     17 '17 years'
     18 '18 years'
     19 '19 years'
     20 '20 years'
     21 '21 years'
     22 '22 years'
     23 '23 years'
     24 '24 years'
     25 '25 years'
     26 '26 years'
     27 '27 years'
     28 '28 years'
     29 '29 years'
     30 '30 years'
     31 '31 years'
     32 '32 years'
     33 '33 years'
     34 '34 years'
     35 '35 years'
     36 '36 years'
     37 '37 years'
     38 '38 years'
     39 '39 years'
     40 '40 years'
     41 '41 years'
     42 '42 years'
     43 '43 years'
     44 '44 years'
     45 '45 years'
     46 '46 years'
     47 '47 years'
     48 '48 years'
     49 '49 years'
     97 'Not ascertained' /
 FMARITAL
     1 'MARRIED TO A PERSON OF THE OPPOSITE SEX'
     2 'WIDOWED'
     3 'DIVORCED OR ANNULLED'
     4 'SEPARATED'
     5 'NEVER MARRIED' /
 RMARITAL
     1 'CURRENTLY MARRIED'
     2 'NOT MARRIED BUT LIVING WITH OPP SEX PARTNER'
     3 'WIDOWED'
     4 'DIVORCED'
     5 'SEPARATED FOR REASONS OF MARITAL DISCORD'
     6 'NEVER BEEN MARRIED' /
 EDUCAT
     9 '9TH GRADE OR LESS'
     10 '10TH GRADE'
     11 '11TH GRADE'
     12 '12TH GRADE'
     13 '1 YEAR OF COLLEGE/GRAD SCHOOL'
     14 '2 YEARS OF COLLEGE/GRAD SCHOOL'
     15 '3 YEARS OF COLLEGE/GRAD SCHOOL'
     16 '4 YEARS OF COLLEGE/GRAD SCHOOL'
     17 '5 YEARS OF COLLEGE/GRAD SCHOOL'
     18 '6 YEARS OF COLLEGE/GRAD SCHOOL'
     19 '7+ YEARS OF COLLEGE/GRAD SCHOOL' /
 HIEDUC
     5 '9TH GRADE OR LESS'
     6 '10TH GRADE'
     7 '11TH GRADE'
     8 '12TH GRADE, NO DIPLOMA (NOR GED)'
     9 'HIGH SCHOOL GRADUATE (DIPLOMA OR GED)'
     10 'SOME COLLEGE BUT NO DEGREE'
     11 'ASSOCIATE DEGREE IN COLLEGE/UNIVERSITY'
     12 "BACHELOR'S DEGREE"
     13 "MASTER'S DEGREE"
     14 'DOCTORATE DEGREE'
     15 'PROFESSIONAL DEGREE' /
 RACE
     1 'BLACK'
     2 'WHITE'
     3 'OTHER' /
 HISPANIC
     1 'HISPANIC'
     2 'NON-HISPANIC' /
 HISPRACE2
     1 'Hispanic'
     2 'Non-Hispanic White, Single Race'
     3 'Non-Hispanic Black, Single Race'
     4 'Non-Hispanic Other or Multiple Race' /
 RCURPREG
     1 'YES (CURRENTLY PREGNANT)'
     2 'NO (NOT CURRENTLY PREGNANT)' /
 PREGNUM
     0 'NONE'
     1 '1 PREGNANCY'
     2 '2 PREGNANCIES'
     3 '3 PREGNANCIES'
     4 '4 PREGNANCIES'
     5 '5 PREGNANCIES'
     6 '6 PREGNANCIES' /
 PARITY
     0 '0 BABIES'
     1 '1 BABY'
     2 '2 BABIES'
     3 '3 BABIES'
     4 '4 BABIES' /
 CURR_INS
     1 'Currently covered by private health insurance or Medi-Gap'
     2 'Currently covered by Medicaid, CHIP, or a state-sponsored health plan'
     3 'Currently covered by Medicare, military health care, or other government health care'
     4 'Currently covered only by a single-service plan, only by the Indian Health Service, or currently not covered by health insurance' /
 PUBASSIS
     1 'YES (RECEIVED PUBLIC ASSISTANCE IN [INTERVIEW YEAR -1])'
     2 'NO (DID NOT RECEIVE PUBLIC ASSISTANCE IN [INTERVIEW YEAR -1])' /
 POVERTY
     50 '50 PERCENT OF POVERTY LEVEL'
     700 '700 PERCENT OF POVERTY LEVEL OR GREATER' /
 LABORFOR
     1 'WORKING FULL-TIME'
     2 'WORKING PART-TIME'
     3 'WORKING-TEMP ILL/ETC'
     4 'WORKING-MATERNITY OR FAMILY LEAVE'
     5 'NOT WORKING BUT LOOKING FOR WORK'
     6 'SCHOOL'
     7 'KEEPING HOUSE'
     8 'CARING FOR FAMILY'
     9 'OTHER' /
 RELIGION
     1 'NO RELIGION'
     2 'CATHOLIC'
     3 'PROTESTANT'
     4 'OTHER RELIGIONS' /
 METRO
     1 'PRINCIPAL CITY OF MSA'
     2 'OTHER MSA'
     3 'NOT MSA' /
 YRSTRUS
     1 '1968-1989'
     2 '1990-1999'
     3 '2000-2009'
     4 '2010-2019'
     98 'Refused'
     99 "Don't know" /
 OUTCOME_I BIRTHORD_I DATEND_I AGEPREG_I DATECON_I AGECON_I FMAROUT5_I 
 PMARPREG_I RMAROUT6_I FMARCON5_I RMARCON6_I LEARNPRG_I PNCAREWK_I 
 PAYDELIV_I LBW1_I BFEEDWKS_I OLDWANTR_I OLDWANTP_I WANTRESP_I WANTPART_I 
 TOOSOON_I NEWWANTR_I AGER_I FMARITAL_I RMARITAL_I EDUCAT_I HIEDUC_I 
 RACE_I HISPANIC_I HISPRACE2_I RCURPREG_I PREGNUM_I PARITY_I CURR_INS_I 
 PUBASSIS_I POVERTY_I LABORFOR_I RELIGION_I
     0 'QUESTIONNAIRE DATA (NOT IMPUTED)'
     1 'MULTIPLE REGRESSION IMPUTATION'
     2 'LOGICAL IMPUTATION' /
 SECU
     1 '1'
     2 '2'
     3 '3'
     4 '4' /
 CMINTVW CMLSTYR
     9997 'Not ascertained'
     9998 'Refused'
     9999 "Don't know" /
 CMJAN3YR
     1345 'January 2012'
     1357 'January 2013'
     1369 'January 2014'
     1381 'January 2015'
     1393 'January 2016' /
 CMJAN4YR
     1333 'January 2011'
     1345 'January 2012'
     1357 'January 2013'
     1369 'January 2014'
     1381 'January 2015' /
 CMJAN5YR
     1321 'January 2010'
     1333 'January 2011'
     1345 'January 2012'
     1357 'January 2013'
     1369 'January 2014' /
 PHASE
     1 'First 10 weeks of quarter'
     2 'Last 2 weeks of quarter (double sample)' / .

EXECUTE.

* CREATE SPSS SYSTEM FILE.

*SAVE OUTFILE="spss-filename.sav".

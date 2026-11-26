//Rotina...........: TCMCrypto
//N. Sol...........: 96163
//N. Kintana.......: 415949
//Data.............: 18/09/2008
//Responsável......: William Santos
//Descrição........: Foi adicionado na const ValidChar e na TableCode alguns carateres
//                   ("¹²³£¢¬ªº°''¨¿ñÑ¡öÖÜüØøËëèåÅæÆÄäŞşĞ) especiais que estavam faltando,
//                   para evitar erro de caracter inválido.


unit uCMCrypto;

interface

uses
  Classes, SysUtils;

//William Manoel dos Santos - 18/09/2008 - N. Sol 96163 -  N. Kintana 415949
const ValidChar = ' !#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_abcdefghijklmnopqrstuvwxyz{|}~ÀÁÂÃÇÈÉÊÌÍÑÒÓÔÕÙÚÛİàáâãçèéêìíñòóôõùúûı§©®"¹²³£¢¬ªº°''¨¿ñÑ¡öÖÜüØøËëèåÅæÆÄäŞşĞ';
//                 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678
//                          1         2         3         4         5         6         7         8         9         0         1         2         3         4         5         6
//                                                                                                                    1

type
  TCMCrypto = class
  private
    TableCode : TStringList;

    function Procura( Linha : String; Ch : Char ) : Integer;
//    procedure DebugToFile( sStr, sArq : string );
  protected

  public
    constructor Create;
    destructor Destroy; override;

    function CMEncryptChar( Charac : Char; Key : String ): Char;
    function CMDecryptChar( Charac : Char; Key : String ): Char;
    function CMEncryptStr( Str, Key : String ): String;
    function CMDecryptStr( Str, Key : String ): String;
    function CMEncryptFileFromStringList( FileTarget, Key : String; Source : TStringList ) : Boolean;
    function CMEncryptFileToStringList( FileSource, Key : String; Target : TStringList ) : Boolean;
    function CMDecryptFileFromStringList( FileTarget, Key : String; Source : TStringList ) : Boolean;
    function CMDecryptFileToStringList( FileSource, Key : String; Target : TStringList ) : Boolean;


  published

  end;

implementation

{ TCMCripto }

constructor TCMCrypto.Create;
begin
  inherited;

  TableCode := TStringList.Create;
 { //William Manoel dos Santos - 18/09/2008 - N. Sol 96163 -  N. Kintana 415949 }
  TableCode.Add( '7EÙn[CyOH#lt>Éò\NÒ+s9bÓ0XW%ÔâÊ*ê]-i@=qhèãaZìàI úFJeñ}Á|VLDo:<4GxfYíÕ~_Q3ç;mgõ^óRM®{&$rT)vz1áp/Ûjô©(.ukÍùÇ8SBc§P,Ã6dÀUÂıwÑAéÚİ2Ì?È!5KûÅ''²³ëæ£ÑåäÜèª¢Æ¹¿"º°öĞØÄ¡üøşŞñÖË¨¬' );
  TableCode.Add( 'ÂÙİÌE)G>Èo+zÒwô<ZHPQê05©yÍ*kíBÀÔU]®haó;Ó@u1{8!}-qteN[à Õñ.Ûpv/,(73n\ìÚõYèò|F_&b§g92LT=VréX~ijcCSçâ%úxÊ4IáÉû^DJW6$RKù?ÃAslmdO:#ÁıãfMÇÑÑ¨Üèæ²ŞÅÆ¡åöÖº°Ø"³ä¹''øª¬¢¿ëËşñüĞÄ£' );
  TableCode.Add( 'e[)@óÁ;Çù=éZÑm©MpTãfRaíÕ\ñúÚN>cCásXİ!jQvKÔ+-9y8_.à%S®(ED§1/toÒwÛF?ÊbõÂâOxÙzêHUJ<*Wrhl 5ì&V:^ÀôB7]Ì6uÉAÍÓÈGò$Pè3i|~ç,dû}q{gLı#02ÃYnIk4''şĞ¡ñÑªëÄ¹Æ"¨¢æÖüËØäö¿åŞ²ºèÅ³Üø£¬°' );
  TableCode.Add( 'ÈêiÌ[M(8ZnûeÒç/.©ıCYRI!ÃÍ^lÙàwcÑoUpEHÂ}B]:ua$N\4@éyìSKô5õ+âf6ÊkÀã1t0<7;ñÁ®W§9íÓPTAj#%mD{xgvÕ=-búOJèÛòóá~&zX|ÔÚdhsG3q *É,)FrL?ÇùQVİ2_>¢ø¡ÑåèĞüö³ÜÖŞ²ËÆº"¬Øşëñ£Å°''Äæ¿¨¹ªä' );
  TableCode.Add( '|çUqIıòjKF+d>Âbt_®ó}2#DyCcvwÌ©u69%Úrl*!Õ1õÑMêA$\Y?T7sz(iEZáe/=RpÀôÔÁW0ñ&ão.ÒNíÊÈúV<LPma4ìâ5Ç:X;fQ[~SÙg É§)hûÛHéèGÍİ@,3àkJÓ{^xn-ù8O]ÃBÄ¹ñøş³ÆèæÜüÅ"°å²''öºÖØªÑË¨¬ë¢¿Şä¡Ğ£' );
  TableCode.Add( 'pí sìeê8tó3*âY7KUÛÙ:9@.PÚ;\m}ÀÊi&ÈZzÂ®1èjÌİıfohñÔS+/W©§x)-ô5ÇÕÒáVù<Éw~ò{TRõ0!v4]Á%EN=ÑkDHdãAàyXQ_OMc,éICBûÍ|rÓgÃnL?(^a2úç>$JG#[Fubl6q³ÑöëüñÄ''ÜäËøÅØ"°åş¬¢¹Ğæ¿Ö£¨º¡Ş²èÆª' );
  TableCode.Add( 'o/J]&cÁÈxNÀT)6AçBV<*É,õ@éiQÓÃ=Xp#rI%Z$v®KWÔ?EwCùñÚô;7[àO1úzÌ4ì:(Ñè>~mPy3ÍGÛ§+ehtâs{lûM|0F!9òLj Ç\ãd}-bRıquÂgêaD_kİSó8n5^YU.Òá2HíÕ©fÙÊ¡ş"ÆÖËÄ¨ëÜ£ñºŞ¢°üÅøªÑèö''¹äåæØ¿Ğ²¬³' );
  TableCode.Add( '7§vıR%~aTIìUãLu(8b@Fm?[ûXyN&px2;qéÀÛ|á_ ÚZB<EİkQçÕ)]zí0gfDS-e®!G:/ètÊòà$^*sÓúJ9©wÍnÔÃ,êH5ÁrÉOÒÙW1.YP3#ùhÈMÑ=ÇÂo{ôAñ>6ó4}CKlci+Ìjâdõ\V¿£ÜåŞº''¡ëüªÅñ³Ñøè¨ĞÖ²¹°Äæö¬"ÆäşËØ¢' );
  TableCode.Add( '-&yJEzM§Çe ÈCLâf]?uGÔê<©RNhúdt}rûFInvÊqàO(bY8|Ócíã.7_l#oÍòô=3AÁÚk/iıçUS42*pìÌéj0VwÉmñÃT~ÙDWH%1x>Ûèİó@ù6Z;õXPÂ[\^),a!KBQsÑ$ÀÒ+®Õg:59á{Öå¢''ñ¡¬³¨ËÄÆä£ĞëŞØÜª¿Å¹°ø"üºÑ²şöæè' );
  TableCode.Add( 'YÇ-QxUÑZ%e$A[}3=#ÊÔ©(tÕ!ùEVça~qzÀÓíb|R57y+Dõ6&N?^É9éãèû\dirn_8êò]HmI>c;ÁÃOúfG{1.âpà§vXÛÙJáMÈôlÂ,BLT®ìK)İÌ:*ıñ/óPjswS4WgÚh2 @uF<CokÍ0Òº"Şë³ÆÅ²¿Ñ¢Üö°Ë¨ø¬¹ªØĞäèåşÄÖ£¡''üñæ' );
  TableCode.Add( '©J,!8Óİ9=?FuÌÑ%ÍÛd/È®1Eq|xX_UâB\ãúÂ{>f@5L3ÉÚQ&íKRáhjeMwvYñ $;oÀmbitc2àZ7)-zìOÇÕ<Êûê#^lgòG§k0SùÙVHè~WI[Òpn:NCÁaôryç*}DıóA4é+PÃõ6]s.TÔ(ØåÖ''Å¹²³Æüö£ªÜä¨º"Şæè¢ñÑ¬ş¿ÄëË°Ğø¡' );
  TableCode.Add( 'XdÃ?ÕIaeóûúZxH.Môá_çlÁS0&r<vı+G7ì©4õãfk*8Kz{U!j%®cNÚÑ#]ÉoD-WİÂéÓLnY§uÌhÔ1}Qb@èBâÙàFJV[ÀÇTyPñÊ>íp9i5ò(w:;AOm2 ê/Ò^3$)RE\|sÈC,6q=tÍ~gùÛØåÖÅ¹²³Æüö£ªÜä¨º''"Şæè¢ñÑ¬ş¿ÄëË°Ğø¡' );
  TableCode.Add( 'Ç\.0H,ÔÒM1À%bÕà(fãzùm#p9N4é8eP5íçg7^va=@urwêóG*VÛ3~§6È/K;lTF>Ss<$ÓW!QİIZqRyoÃBtúá{[]Ñ A©ûôCOâD_ÙòdÍJ|ÌÁÊ-E2Úõ?YUÂkÉxL):cXhèı®&+}ñjìin¨ØÄ²¬æªÖ"ë°Æåöü''¹¿ÜÅäñĞÑËşèºø³£¡¢Ş' );
  TableCode.Add( 'r4UÃÛfiÔ?(òo0Áó1Ùbjk|@ÚıéÍP7[wÈF32ÂâÇn%m8hREIu;9]Lİúûv.Q Òá}M§JõÓ*sN!êt^ù>/SèÊ$Õ&{Tl©à+gqÌd=XK:ìaBZG®\ç~yzY5VpÉ)#À-,ôcñAC6OD<ÑWHíã_ex¹ĞÅÄØåËëŞñ£¬şü¡öÜ¿ø¢³Ö''¨"Ææº²äèÑ°ª' );
  TableCode.Add( '=qri2óàjíQCg97êu8p|&$zÔKİ©Ú6édS/]ÁJÀúvBPGsYDèXFÌx{bÉÃ§0-ôì?ãUÂılER3[(â#!~á ^_®Wwk>AÕNÛû@5òÊV;}+c\*f<Íñna4L%õheÙçHoZ)ÈÇÓMùÑIm.1:yOTt,ÒèäåÖÑø²£¡''Ë¬Ğñ¢ØöŞ"¨¹æªÅºüÆ³ş¿Ä°Üë' );
  TableCode.Add( 'ã6cú~ı5[(b_y/Ù#íô1Ûİ*Á©}3ÒÉoõÌlÃÚmpKkâ+h;C\BXÈwQçÂòPsrZ],&7AñUMjózIÑD?@:èfiFa§ê)Íu|SYÓÔû!.ÊLRéOù2ÕÇìd8ÀE^®eT<$n4áH-{0=%NVJ>àxgW qG9vtÖ¿ö°ªüş²ØÑ£¡Ü³ĞÄ''ŞÅ"ë¹ñºÆ¢¨äèåË¬øæ' );
  TableCode.Add( 'Dw,>Zão%}#cpbóêá^+ô$ÑÙd§ÓmhÚ@Y[ufâC1©ÍU<T/òÉèsk_y4ÂE8~6P&VM-=:Ò|rSÃ*0Nñi!7 Çt{LÛXBÔùú3İ?Á5û.àınFjÊ)QWzRÌ;\lOHGÀ(ìÕíIqxõeAÈ2g]Jaç9®évKº¨äÜÅØæÖ''Ñ"ş¹¬³ëøÄå°è¢Ğ£ª²ÆñöüŞ¡Ë¿' );
  TableCode.Add( 'Pé aBÓÔDT2HmèİÌêMhó)RàN©7Q%Sq}<r>/oÃ6Oıí#uLÉ?KÙûXcò|Jñ*^ÚE]ùÛÈl1eWâvy8Í,Õún-$Òç:V+Ysì;[I3áF0kbÇ@xwt§UÂ5j\ACÁ(ô&9_gZdz.õ!À®Ñp4~iÊfGã={³Æ¨ñĞ¡ÑÅ²ºØ''¢Şüö¹şè"ÖÄªÜ¬¿£Ëæ°ëøåä' );
  TableCode.Add( 'éèİ$Ç@_âÁçÂS3òIs>6À.vBQ:{h9U<1ì-zÉ8úy![FpC)Gn}7ÔÛ|HÃ#ûYlK\ãrtJ(ÓÌ^k;oôTÙqdgÒw5VjOõD~WXê=?®m+Lfàá©Èíb&ñauÍeó/§A]Êx02 4ÑPÚEcR%NÕı,ù*ZiMÆŞ¨°Ø¢Ë¬ĞÅ¹èÜ¡ö²''³æñ¿ªåäÑºü£Äş"ëøÖ' );
  TableCode.Add( 'sÂcòãû,Ì0I2D)Np+wi|%.éÛvn96 O-J©d=zì!*YóÔ?fxÃe/À{âbõrMQmPhyuàV\RoÊôHBlFúÚÓİíS]ñçù~ÇCèkt;7Ñı84UX:}gÍÉ@AK®ÒÁ([GÈWjEê>T&#LZÕ§<aqÙ3_1á$^5"Æ¨øèĞë''åÜñäÄ¬üªÖØ¡ºÑö£²³¢°ËşÅ¿Ş¹æ' );
  TableCode.Add( ';fá{Òh_ÛwûErçúlèÓ4MjÌWO!ôÑ|p[ãZ~díùQV5âà)?ìéGnk6t71yATõBòcS^oÚ>xİ+KF]DPqÙ8®3Â%\mXóN.C©aÔÀ$ÈsY§9v#ıÍÊe<,&gR*@êb- U2iIÕÁL/ñzu:0}HÃ(ÇÉJ=¬ØÜä''æş³èøü"¿Ë¹ÖªĞ£¡Şö°ëñ¨åÆº²Ä¢ÑÅ' );
  TableCode.Add( 'o[=mpûrO%-ù,§GÈ!Eà/;W®Pá\~İ<è0ÇÔk6 Ú{X4çé+@©ÓM&laÉ.hJ)xq9ÕN:KbõVÛdTIô^Ãñ7s1CfÙ?v8í5#>2yÊÌjLÂ3BÁì*ıAncFói_ê]ú$}UDYetgz|RZãuw(âHÍQòÑÒÀSÄÜş¨Æ¢¹''üå¡¬¿ñ²ÖĞä°øØæºëËªÑ£Ş"³Åèö' );
  TableCode.Add( 'Ôú©àRLÓáM~+Í^Ù4â(dÈÀÌõlSÃİñG§ÛpjÒvP=3mWÂùûkÚ.TeYCÊ)29nìç[Á#%gIfOÉÇ>ò@HıÑA{ycX1uU7QwZÕV®z*F;$r6N\Jiaãt-qK}/h:5íD|x<èoé&ôó êB?bsE]0!_,8Ğ£ëüÑöØ³ñ¡¿¨²°¢ÅËªæ¹Ş"øÄäº¬èÆåÖş''Ü' );
  TableCode.Add( '&1Vb;BELf>),*ÌM5pYr]õtAù@Z\ñ(ıÃ~k6À$?Íç.Çd©h§zWÔ=â !+O}UiÁóêèÉ[lgá{ÚÒ<uNHDúT7-Âj%a:J9w#İIG2ÑÕ4Û^e|Féyã0RûnPmX/s3qcKQÈvàxôÓCìoíÊÙ8S_®òØü¨"ÆÄÅæ¿¢ëö³ñäÖ°èÜş''¬ø£åÑªË²Ğº¹¡Ş' );
  TableCode.Add( 'ÁáTMÃÙ;è?f§20X\1_òpÕìQEmh5Pã7$bK(~|+dy} ÉIÚknÍUÓêVGSNíHLDo#e®jB{&WcÊé]Ôs.àñCz>!-lÀóôÂgrÌ4:u3%wxJùÒZÛçÈv,aqOÇâRû©=<õFYıú9^8İAÑ[@)it6/*°Ğñ¨Ëª¡ä¹''ÖÑ³¢ş²Å"¬¿Øº£øÄüåŞèæÆëÜö' );
  TableCode.Add( 'úwàÉêyBa)GnO4[_*éuv,r/È}d9!ñh©ç&F0ÔÚQq8x<.?fû òijÒm#H|Pcı~:p+íÍ®ÃgkXK>èLCÙRÛ{VõÊ6Óùz5DTãZ;ì(báoó7Â^Õs@Wâ$eÇE3İ]MÁ2IÌtSAlÀU§N1YÑJ-\ô=%°Ğñ¨Ëª¡ä¹''ÖÑ³¢ş²Å"¬¿Øº£øÄüåŞèæÆëÜö' );
  TableCode.Add( 'b[,tU]©w-óÌCzyr |2Ñx/ícp(RhÈñ@Y#fnÊQeWù.®à0Fô§Úi84avİç&êÍ~$uì6j{ÕGı915BÉ)EJO%âÂd=>\M^*sÇqá;PèÃX+ÙVNòÛûéúõ!7Áã_:loZLmDÀSTÒÓgk<ÔK}H3A?I¨ËÆ"ñÑØÅ£ÜĞ°¡º''²åüèªæÖŞşö¢¿¬äë¹³øÄ' );
  TableCode.Add( 'ã1(,§Ûà %6Oá+j.<{/:ôİMÓQG2ÃÑU_e4xõbâíç]g©ÂSWÔ3-Éi|=5ÌJ0$*ùR&7X8Lmo~NnAcóÙHT>rÍÁZ\Òf}wè9B[ÕFdúÈEûÇıYzh^k®tP)uDaCÀVÊêp@Ú;véKsì!ly#òI?ñq£äøº¿Ë''è²ÆüëªÄÜĞ¬ÑşÖÅ°ö³ŞØñ"¨å¹¡æ¢' );
  TableCode.Add( '7ûU6ufco1LIñãMÁlÀVbÈ=ıÒùQeDõ<Ó+éÇK-úÉx0_XçS{Ê§êE3Õ(H%}2tí$ÂrR/yd9w>@;Yá^òAÃaÔâ.GF?ÍWPvOkz T58&|ÑJ©èİÛ!ó\nôsC]Bq4#N)h®:ÙmgipìÚj,à~ÌZ*[ĞÑäÆÖ³²£Äö¨"Ëèª¹ºÅøåÜŞşæ''ñëü¬¢°¿¡Ø' );
  TableCode.Add( 'hP}z!\L4USÒ0ItmO;Ñû8rfnlÛHvqJbGèY7.wÂ{&_yEk Ó?à[R^ÃZ>®Ô~âé%@ejdÁçB©,cx*òK(1ıÀóÍÈİõÚÌMWV<ã=igÕD|AFT#5]C6ù-s$)ôÙÉ+9:N/o§úì3Êp2XñaÇuáêQí£³æå''öñ²¬ø¢ÑĞë¡üËÅ¨ŞşÜØ°ÆºÖÄè¿ª"¹ä' );
  TableCode.Add( 'gk2h$ÑíQàvúã%çZÍ7jt;(ÌCÂF[#oRÊ}ıSB,?KÉ=uÀPf~DlXÇ]ñóU>èE5n®cb34T*âÚJû_N:)ÕG9.iAzaÙÒ!MHÔ-06põ/§@^Osêq{ùô ©Èm&<Vwò|Û1\rxyYée+áİ8ÓìIdLWÃÁ°üÖ''¡³ªşè"Ş¿äÑøë¢£åæñ¨¹ÜĞ²ÆÅöØÄº¬Ë' );
  TableCode.Add( 'Ú\YRçl[ò;Ô9Â0@~á<sì6ÉF-bXéVuúÕ(©=/MtóÛ4âàegcD$xaÇ)+®7ÓWH§ãiZJKı]GS_níd%BOİ>|18A#,È^Òyr5Qè2ù!ÊIÙ3NkTfÌqpCõñEmv&Uz.j}Í?*L{ê ÁPûhôwo:ÀÃÑ¨¿ë¢äĞèŞØÄË£ÅæÖ''øşºåª°¡²ö¹³¬üñÜÆÑ"' );
  TableCode.Add( 'tTÃbèínS.®Dxi3ásmúH0@lAÑõMU8,Ç:Xç>u5QÔv#ÌG1chjfPwo]dÍ_E?2~!<ìrRzû*ÂÉ4ê|à[LBNYù6qIpO(Ê7§Òk/$FÁÚÕ\©Èe-VZK^İa+ôıWg%J)yÓ}ñÛ{éÀ=9;ò Ùã&óCâ²øŞÜ¬şÆ°ĞØ¨üæ¢ª''Ëö¿³£Ññ¹ÖÅè¡Äëä"åº' );
  TableCode.Add( '®:iúÚèçìÓ \ô1yéñ$>R|Dkûfopx2OÃídl8HÈı}Ñ^ÛÊ!ÂÒXu&[F?(-GN#BZ46~âÁ+W©òmKTCê/Ís*=Éã%b@9hÀÇ;à,ùPİ7Uqó5áÌ)Y3v0{LAcwa§]etS.EjIQõrgJM_ÙznÕÔV<³£Ñä²ÆºËØøªë¿ñÅ¬åè''ş°¢"ÖÄÜ¡Ş¨æ¹öĞü' );
  TableCode.Add( '@ÁoEK}RhVÓ%Q][M#uáÚâ${-)wÇÈ®|Cà^ÛjíYfcP<8xô9aı=nD!6UûelJG+; IÂWì/Ã>5gSê0mX_sÊóyÙNFÍ1TZİb,ñLrÑ*ã(ÕOq4èÉzúÒ7&:k\Bòù3pi?tÌ.çdÀév©Ô§õ~AH2°ñ"ÄøÆ¿¬ÜŞşæ''ËÖÅ¡¨Ğè£äº³öÑëüØ¹ª²å¢' );
  TableCode.Add( 'yÙ4CÍ}8áj*çd#@AwDBÂg _1f&Ã[ù]lpR?XÉTMi2Á+ıJ)hÓÚ/qz^<:HÌñ-eÛèK,nÒ§È;EZêàItéaìòQÔ©W(âûP0uõ7{$Àb%xİ9m|Ñ5SLs®oãk\=óíÊO!6cYUÇrúVF3GÕ.~Nô>vªøÄ¢Ğ''Ë¹Ñæ³ü¨ØÖñ¿ÜëÅ"²¡º£èŞ°äşö¬Æå' );
  TableCode.Add( '©&SX6ùQà=vuJ*ÙÉP[ .Ñ/sÀFHo®rá?ÛÌêéÚ7c^x§+B!;èdâmÃh@V|q9íU]OúkWÒ0fñóÈi$G>Aã-_IõN{İl8Le,yò~ÂıûTçbÊg\5ìDMpzÔR%Í3w(YEÕnj4a2:#tÓZÇÁK1)}ôC<ª¹¬ÅëöÄş¡"ÜÑø¢üĞæ°Ë¿ÖñØ²ŞèÆ¨äå''³º£' );
  TableCode.Add( 'k>m/é7Ò+àuG<ÓçtÌÀqÙ$Û2!yÇQ A*óù)L8ãgwñPİõoÕSxÂ~Á@|H,O%Ã]Í(ad[p=#{âlÉDìN§CcMJYís©ôûZBzıe6rÑIÊX:òvÈ.ÚúèhETWiRb4K;9f-1_U^3Fê}n&?\®Vá0j5Ô£ŞñäÜ¡Æë''öüªè°ËåşĞ"¢Åº¹¨¿Ö¬æ²ÑØøÄ³' );
  TableCode.Add( 'ZjÍ@YHWhDÊb\>àzwTéê:Ó*r=İ#è pKfÚùçûAÉV}3ìBQ<®9óeRyO6Ão©%E_XxUG4Á]úm-ÕáõFNLÙ5?ívòcCÔâM|+Çki&/!7~(21sıd)ôaqÈÂn[PÑÀÒ8ã§0J$ÛñuÌ,;t.Sl^gI{²ªĞ³ŞäÖ¬¨ËÆ¿ÜñØ£''åÑ¹"öæë¡ºÄèşü¢Åø°' );
  TableCode.Add( 'ô|GÈDõc3-§Ohl_uèı1©b)=Ó yMpJÁÇãséN,&0QXkeáE58H~ÃW$@Ô?®47qú.ûCm*fÍgI:nàÊ;ò{Ì6oYdùêxì([^À\/]}iB2VjÙçvR!TíÚÛSÑ>#U+âL<ÕK9İZaÒó%ÉtAñFzwPÂrŞÑ°²¬ªñşèË¨³ëÜ¢äöÄÖÆÅ''º¡¿åüø"¹ØĞæ£' );
  TableCode.Add( 'ñrãTòG5a[ìdÊõíİÀFâ_4RÌ8}wE^ÉıhxQMVùÛÁ®ók2.Âô|l*/$D%vZ?Ã#UfÙgbLqBÇ01X<WyÍÓYe imÒ>Au]Õzt§KjJ73+çNI©cá;Sûoêè)\OPÑ:9=úÈÔ,!Hp~6n(à@s&-{éCÚ¬æÑËªøñÖë''åÄ¿Æ°¡"¢è¹Å²ÜäüĞ£ŞØöº³¨ş' );
  TableCode.Add( 'Ú®#Í&VZ7uãxUb./+FÌİCûwm8s?P@ Ê1]©gY-pÀJIÔ6çÒaAó($éLÂ§DÓvÑBíG9È3=[ÃM)ÉÇıèHj{~<;itâ|rXWñÕ:K%õO!0hÙoed_>ôùNS,Ey5k2R4lzQá\ìúÛÁàcê*^Tn}qfòñøØÖÆ²ªÄ¢"ä¿ÅÜº''¹¡è£³Şå°öÑ¨¬ĞëşæüË' );
  TableCode.Add( 'X®éyU_ÇÓàÁ|á9òùJSÑdN)&oãaıÉp[õóê@OzBÕ©Qxsf$:^ÙİâèúP\HK,Zl}GÚ ]2AYìÀc?C#ienÃ(ÛÌ/~Í%wçtÊô1§70+kíÒ-ÈmFûI;Ô*Lv<{!6TÂ=5gWjM>Db4ñurREh3V.q8¹ª³Æ²æşÑ¨øÜöºŞË"Ö°¢ü¿åĞ''è¡äÅë¬ØÄñ£' );
  TableCode.Add( 'áj$ÚN{S}íHé.!ÀôyzFÂÉCu;ixÔ4PM:Ò2@ARcèàÇñsZ~<pn|d *ò?/ÌL9ì15gÕV(+ç\§rO]0ÊãB,Ul_óêDÛt=JbqİÍTõIâ8YXKm©ÙeùaWkf6&Ñ^úû>ÁÃ)E®3[QÓ%ıÈ7#wh-oGvë°ØËñÑ"è¹Ğæ¿ÅÄ¬ª''ºŞÜş¢£¨ö³å²øäÖüÆ¡' );
  TableCode.Add( 'O~V{Ò( ÇHQbS#B+Ñù-]ôt?É3áÚú@ckÂ1ÛM8rçê^IÁT/àì$;©.®õÌñ:yoÈWwé9nfèûÕNj7zxÓÔCíAg4DUqleGÃZİEu2Êòs!i6JdÙ\v0%,)}pRPâLXãKı_h<*[FÀ|óa5mY&Í>=§ØşüæøÖ¨è¡Ü¬ë£öåÄ¿''Ë°²ÑÅº"Æ³Ğªñ¹ä¢Ş' );
  TableCode.Add( 'J\]óÈèDg:§<hnÊ4S,;ÍÇõ>sOfXqIéeryêì^R|d$Cw 1EBıxoPÙZ.0/5jÑHÀÔ6!ûk?LW}7M)#iÒ[{bÃ&9íc3*ãÌÛÁl®Gú+_%p=Và©K~ùô@Ó2váñFÂòtİQçzÕNUmÉ8â-(ATuÚYa¹æ¢¿Ñ¨üş''°öÄÖĞ£ŞñØ¡²ø³Ü¬ËÅ"ªºÆèäëå' );
  TableCode.Add( 'NkiC+V>#?É0ÌqI%Úè!4dylÈB2fK<íÇH|@Õ&ZJWDeõÙ$ÂwPjéO;Àmûã8âçñ~§RÊSv]àÛ:,©)X{LbıÓTM İ^pgêô9ÁQáGtF6óaù1AnÃ7úÒ5ò([3_cr®Ñ\hì*=xzsÍÔ-.uoEU}/Yè¹¨ëØĞÆªü°ö²¡¢Ö"ºÅ¬''şËñæÄÜ¿ø£ÑåŞä³' );
  TableCode.Add( '-òÑd%Ì0wÂİùÕ3#tWCV;8AGEÁgóYr7á&hUÊícyJ/ú<(54Èê:pÇnÀ!DFb>]{ÚÔ}Ó=§ıûÒTe~àÍ uLMmÉOPa[\â©ã,K®^f?*)s.qèÙ_1zN|ñvôQÃHiéjRS2kx9ìõ6X+o$lç@ZBIÛöø¡ŞÄæ¢Ö¨ªÜ³ÆåËÅÑä£¹''ü"Ø¿º²¬°Ğèñşë' );
  TableCode.Add( 'Q5?-E§ nN>à®ÇtÙ},f{X#$6YbIK&ÑôUyWqx4çplZaìAvM|Íéo8.ù7ÈÊÓm!ò3=©]+íP<1DGõóe@dJú(ñL\%wÀOháâûBFê:)c*ÂÒırVÔÌ9;ÉTÚ2R~ÁHikèSs^/Cgã[Ûz_uİÕ0jÃèöë²åæÄ¡Ë¿ĞÖ''şÑ³"ŞÜØ°ø¹£ñÅ¢äÆ¨ºü¬ª' );
  TableCode.Add( 'bQı?Vó*&LFÑB^-ì4rAszÛ8%.ñ=9H(d<,ÍkÚpôùÃÕ[;ÊKlZâecÂC ghGvSmU#iÙÁ)_Ó2òJOj:T!~uènÇê\MÔçõÉ1Ìáx>§ÈàEW|@o0YPûÀÒq$}/6yN+DRİ©I®ã75faX3íw]út{é°ëÅØ³"ñÖèöº¢şÜå¬æ¹ü²ËøÄ''Ñ£Æä¡¿ĞªŞ¨' );
  TableCode.Add( 'ÑÂÉ6~T?fAlñ8Mì0UÁ=t3}póc;LÙDòx]_ÕQRôeÒÓ!Xw:.5<àB9( 4Iá%@^ÌNjvÊSİõZd7/ıÇ$GrûbùÛWk2Ígqã®m1§+&FyÃi{©Csêè[âh,Y*íOnVHoa>z\ÔÈ#)-uKP|úÀÚEJéçëñ³ËÖÄ²æ¡Ğ¢''äÑÜø¹"ş°Şª¨º¬èØåÅö£Æü¿' );
  TableCode.Add( 'Yh8^çùìİaw{ZG<§fLPèÁr1zÂlRÉÙÕQûíÑn*Uá!Úgã|$pJHÌNÊıVÔ@(úTSõòA=0M_2]%7é.q69Ev,~4myÒK C-XóÓDkÃ[ê/jñÍ#IÀ©Bb+5;ôFWâÇ)}àdt\isxo3ÈÛucO:e?®&>ñËĞşèÆ¢"Ñ²üë³¬Ö¹¡æ¨''ö£ŞÅäÜÄªå¿øºØ°' );
  TableCode.Add( 'éÚ?aùTõ-ÈÉPÓp6Ì(BnÙ:tó,NCYmÇA<Í!dwHU^oOıcqvÂÛ;ñXb]9ì*§x\yâD1GKÀ5û%h+W/&ÔÊ=í fElIk_áèjçrL|gÕ)ÃòQ{Vsê.uÑ0FôRe©$@úÒİà2Sã[8Áz}Z7#4>iJ3®M~ÄöäÆÅÖºñªå¡"¢şø¿Ş³Ø¹¨ÜëË²ü''æè¬£ĞÑ°' );
  TableCode.Add( 'DÍP,ÙíTqI:~<o79WHz?K*Áj6ãÉ{CwÔèÚkònAáh§d_Z+ÀpçÑô&â5FQyÓvR®ú0ÕNmVgsx#È3%éÌeicG]2t;^Çar})YÊ=(8U/|\Lb@ûÒÂÃ-İS>Xf4uÛ!êàì[õ BJO$ıñEM©ù1ó.l°³ÄëØÖÑªşè¿²ä¨¢£º¬''Ğüæ¹ÜŞÆñÅå"Ëöø¡' );
  TableCode.Add( 'Ú_OCÒh4AÁ9íıkÂéÓT êZpDñç[\Y}Ù!fòó§/58NÈá@yzX*~WÇİ#)rU|?$2ô+ÃK=úm7Ids:<x;àÔ0(SV>wÌÑÕFvÊ61Rânc-ìùèûJ%a3ÍiBEgQb®MuoÛÀt&õHGqÉ^,Pl]{.ãe©jL"Ëë¹¨ÑèØş¡Å°öŞüĞ¬ø¿Ö''º²ä¢å³Æñ£ÜªÄæ' );
  TableCode.Add( 'p:7Oâ[Aá.YZí0ìb}U*iÍM9ÇÁ#;5V/uE§DçúTN~PQWlé®À©oFıè|@4(SÊ3R$n6^Ì1ûòrÒaCq2sêkB!8İùGóÂÚÛxÓ\ôyc=HÑj{e,JzãKÕX-LÈà]õhñtÃ<ÉfwÔd_?Ù+g >Iv&m%)ä¿²£º"°ÄĞªÜÑñå¬şŞØè³ü¡''Å¢ËøÖæÆ¨ë¹ö' );
  TableCode.Add( '=Et{?ÍUÉ}SIlWp0wÊL(Y+évÕù~sÑ&V2F-ñÀNâkDÌûoèHÃ©6c;*ZB%^§ e,G.f1<ÂJóìn7)OÔı:iúAQ@ô_4íX>Ç3òh#8amÈãxêyçráàCÙdbõ®\gİÓ9TMjÁRq|$u]P!/ÒÚ[KÛz5ä¿²£''º"°ÄĞªÜÑñå¬şŞØè³ü¡Å¢ËøÖæÆ¨ë¹ö' );
  TableCode.Add( 'z$ÑÇvÌF]9§cİ>^í,WKQ4ZòìfÓ\@8T7úÒxé%YCg;LùJ*B|çO©/:HàpXb[P <VdÂ{=()ÛâomslôÃ3r#RÁ6êGÙıÕ&StÊw!Uñ~Éáèó®À?-kueahÔy+È2ãÍõqI}D0E1M_inA5ûÚ.jNŞĞÖü¿şö¨å°Ñº¹¬ëØÅäË"èæ''ÜÆÄ¢¡²£³ªñø' );
  TableCode.Add( 'P-êWÊ,@3dM*59K?bÀÒLÇJã=®éhÃû jíù^8O|.#áÕÂ2§\ÙT]AI0ÛèBxÚ:q&iZÌ7EeNlkÉàzìS/İu_a6UâQpt4ÑõÍòsúXg<~GCy%+Fór[YV$o}ÔnDıHwÁ)m(v1>!RÓÈñç;fôc{©¨¢ä¹ë£Æñª¿øØÑ"şÄĞæÜ''²üöÖ¬¡ÅèŞåË°³º' );
  TableCode.Add( 'j{ÊxVñLÙõ.~}GiÉgÈPùà8#OÚ%é6(ÌKBúaÛ<bWíwkq=ûÍ/çIvzêXm,JáfrhF2@ÃÒ!n-|Õ_Es>Y^)ÓıoUH©\âİT p?$t&1óQòd;Á9ôAÂ®7+SìÇ4§3eÀuND*Ñ:lRZ5C0]Mã[èÔycåÆ³£ºèØøĞ¬æ²ö¡¨¢''ªÖ°Ü¿şËüÑë"ñÅÄ¹Şä' );
  TableCode.Add( '^SúÃà5ÑnVd7pû[.N(|bhãMsa§ÒGyêrÈùw=,_>Íz\~@OõÚXá$2H{8YÇRWò4Â0®â m9İP)jc:qÙDAÓÌóQo%*J}3©tv+iıÀZç?/ÁFÕéCe!-&èT1Uf<luÊÔôL]#ExÉíkgñKÛBI6;ìëÅÑĞÄøŞË¢ÖÜæºå¨şª²¹üñ"¡''èö¬Ø³°Æ¿£ä' );
  TableCode.Add( 'ÑÇqûh+!=ÀÊC:Á9ãLıWçéJstÓy j*Y1R\rÉ@OB?0ÛZP6GxAÃK$^n|©Q_HiEÚ(avb]&XmF8d®â[V}ñÍoÌU~pêì<l#e)òT;ù3cèÂóS-úÙkÕwİáàõÒN2>4u{.gfÈ%zI/7M5ôÔDí,§üØ²ñ¨ö³Åè¹Äºë¿ä°ª£ÜÆ''ŞĞ¬åø"ËÑ¡şæ¢Ö' );
  TableCode.Add( '=|MòÙ4ÑN/ùÇcÌZwúGnC5ã§!lEuàYÚS©ç3É0b1~(mX)qÀT,fHDpÂP-áÕt]ê*{9}2ÓÈFâ[ÛzİA®èìQ7ó@.sROaKíI;# +<>:8$ÃÒ6ûWVıÊJôLh&x^Áeõrk%?Bé_ÍñgjÔoydUi\v¢ÄÅ³Ë¿ªæÑØÆºöë°Ğøä"''Ü¡²üşå¬¹Ş£ñ¨Öè' );
  TableCode.Add( 'K;S^ÁxQ©ÂíÔÌw)Êã§P!B}Z9Àù|È,p$ôG é*]:çAyk4<#Ò%31iNá{âjXM@ar>H5IÍFTÉı6.ÓÛf&EèõûìL[zb/8(?tYWu=svÚ~ú\0ò+ê7à-Ùgo2ehVJOÃRDCcónUlñmd_Ñq®ÕÇİ¡²şºØËÖÄ¹ÑĞ''èåÅ¿£³ø¨°ªëÆÜä"Şö¬¢æñü' );
  TableCode.Add( 'd(U=Eñ_ ò8oS!0Òı?ãB®z^õJÇùçH6Ùeót-sm5Êô4êcÌ{XY§ÈÔ2v%RG|nâ+>]wÓpV\1É)urWà#©3jIíì9lb/úÂKáfgDèMLkA~ÃÀû*7QÕÁxC&[@ÚéT}$OqhF;iZa,yİ.:ÑÛ<NPÍöæ²ŞºÅøÖ£ĞªØñåş¡Æäü¿¨°''³¢Ñ¹¬"ÄËèÜë' );
  TableCode.Add( 'UÙÑo0déÒ6^İ4W3fók}XaÊúÚ:ÔzBH~[l5,hç>?É%#À$®ñã©A*S8ùZ.LvFY2tq&R7ÛcìJDinOû1VeêC_-{Ç)K=ÂNyMEbígôÃ\ÕÁ]p;âè PıTjmáÍÓQxs|uÌ@/(GÈõ!à§òr9+<wI¢³¨Ñ£öäëŞË²ÅØøü''èÖ¿°ºåĞ¬ÄÜ¹ñ¡"æşªÆ' );
  TableCode.Add( 'BJnh$~AÔHfyx<ÀjlkíRÓ@#\mg-ÛG7(z®oTıú^óÑd2Útbcùòe*)YN}sãìè=1Ì|IM+©Pq? Xİ;LÊûS[ZÈ4Á,pÍVW6%:iFKà9ÉáCU0D&>âÃêéÇÕÂEçõQ5r]_3Ù{w8.ñ/OavuÒ!§ô¹ëÄş¿¨Ş"üªöæè£ËñÜ''²Ğä¬Ö¢Æ°Åøº¡åØÑ³' );
  TableCode.Add( 'ñdõ\%íJ_~1jÇÒ+pP4g,6|yVLçãiÁ]5s!©U/èÓ0BÉF{tmızaRCİ>xó<}7:8^.e®ÌhkTlÊòúù&ÈQô3ì[$uHvnêâMSE2ÛÕÑKo(rGé?WÍY=wûDO*Úf XÂI;Ô§)à-9ÃNZácbAÙÀq#@£ø¬ëæÆö"ÅŞ¨Ü²Ö¡Ñ°ñºÄ¹³şØäå''ª¢ËĞèü¿' );
  TableCode.Add( 'è5S2dôkÌy+<b ÑqàQlW_ÂiÔ,UòLoÛh#9À6Ájéfá|>vcg©Tú~z?ÚûIMRX*âs.u&DxÃıÒÉ[@Ùm^ó3HB$8:w0aYnÍ(ãtÊì;êÇGrñ}FOPC{KÓ-§4Nõ\V1ÈA!)]íİpçÕ/JE%ùeZ®=7æøÖ¿¹Ñşª¬ö³ºØèÅüÜŞ''£ÆĞñåÄ¢¨Ë¡"ä²ë°' );
  TableCode.Add( 'ú(/d-ò§Y*;2lÓÛ©âÀPıqE3%ùÍT#aÙQXÈeìZbs@JÑû.+6m)Ú{jc!Âêñn^ÇéóC&g9FKy?$H<ouÒBİx\ÊGV7rU®tO:i Sh1ÌÃRfè4AIp=É]D[_8Wz5ôáv~>ãÁõ0ÕLíkÔà}wçM,|NæÑ¡Ü¨''¢¿²ĞæØ³şøå£ÖüèëÄöÆ¹Ë°äÅ¬ªºñŞ"' );
  TableCode.Add( 'ÈgBZ<©Ù?(r1Ôõûuù#ÛêİÂOkâsbn}ì]ÓCxXÇKNh6|GóéoÕ®ÉF8DúlQàÃy;aá=Í*@ÒÊp&MHL)\dt4ÁíôfòÌcè%:9-çeEVARSYã. z[T/^~wW§ÑJ,ñqjmÚ_>{!I35iv2ı0ÀUP7$+"ÑäöË£ñ''ëÆÖŞĞªø¬Ä°¢¹èæå¡²¿Å³ºü¨ÜØş' );
  TableCode.Add( '%ÑõcW9a4ÙNRÉMqyù70ãbjzXà:v^)òU®/ÇfÓ#ZÌQ&32Y.È,ul[_|ñÁwTHmÒoJÍ<AéGhSCôÊVx@O=§ -èú5>ç+(âáÂPíIB*!d?]óFÔk1pÃL©$ÚìÛKİeêÕ;ısÀ\û8rgE6i~{Dn}t¢èËæüØ¿ªşÅÜå¬¹³äĞöº"Äëø¨ŞÖñ°Æ¡''Ñ£²' );
  TableCode.Add( 'Õ^bCsÙúô©5Êe<QÍ,1ÒÈÀA kj7St*xèr[ıaz;oZD@Ú{-pGMU2Ìí8ÔÁ:ìhXİ)9i=N.|ÃB%0~]Ç®O3ûR/!6Ûy#Tçdcà}?â_õÑáñêImw+óWãÓJ(\§LHEgl4nvùVP&u$ÂKqéFÉYf>ò¡°£¿ĞøæÜ¢Øü³"¹èÑë''şöÅË²ÆÖñºŞ¬Ääåª¨' );
  TableCode.Add( 'sO(3N#Xı háG,É\*ÍRHrù;4F-l=SÃE§/ã]C6Òògdc}uiûk2wzÀ)QtUnç©<YÔVM7ÑÂñ.|aÁìÓDI?eõ^vy@%®:W{$K[_19!ÚTBéoúóèíPmpÈÙ~İêÊ>+Z0qàâJ&xbÌÇAÛ5L8Õfôj£¡°¨Ëå''ØĞñªëÅè"şä¬¢ü¿²Ü¹øÆÖÄæöÑŞº³' );
  TableCode.Add( 'eáhNoZM]ÚkUgt©.8-SúY5ÇfÀK@^í6+$âÙ#)lw{*İHÛÉzÔ7Pıòà ãDñÊ4\E&j1rû=Lébôç§>õìQsX?x0aóqcAÕB|T}Á,3V~;ùIÒ_Ñ9F<!Ã®JÂOGÈmy2%WêÓd[Í(iuRnpv/èÌC:²ÅÑªüĞ³ÆËşëö¿Ä£°Ş¨ÜØ''¡ñ¢å¹¬æø"èäºÖ' );
  TableCode.Add( 'hn4)P~5drElÇWQ(û@I8kÕqùFAoêsM=29§Í}|3e.gÑ©b,À{èıİ[Ã7Bòtxj#^ìúÁzÂ%?éw®Cñ0uâí/yDTÚU61ôÒi$&S\Zã:+<ÓRcLv];ÔOóX àÙÉpç*ÈÊNmY_HKáVJaGf>Û!Ìõ-Üèå¬Åü¢¡ş¿ä²¹ëæÖñª''ŞĞÄº°³¨Ëö£Ñ"ÆøØ' );
  TableCode.Add( 'Ab>ùjaGÀ+&SèYâMOHPX)yá®R,òKBÍÃtZEéû~Ép:gV3Õ@kÒ#ÙI9<eÚQ?7h*}.ÔıwÊãq§ê!;_Û/úrÓUõ5FÂô(^İ[s6cÑ\{Ììui4ó|íàÁdvÈÇl=2©nzT01NxñDm J%fL8-$]WçCoëĞø²Å¡ÄŞèÑñ¢ËØşöäª¿³¹''Ü£"Æº¨°Öü¬åæ' );
  TableCode.Add( ']3ÒÇbÕÔs^IÀdS8úE}ì2ÁXô,O6>İ[ÌPó*{mêàÉ.UÂ(nÃ©yht@v4iõ~ÊÈ)LèâÍ1ñ< z9\r$ef!gáıCB-FJq;®oa§ùG%ãRÓ?u5xN7Z&òpÛÚÑcHMík0WéÙlçKw:V=A_YT|Q/ûD#j+ËëüÄ¿Üªæ¹Ñ£øè¡ŞÆöñä¢Ö''¬²Ğş³Ø¨"ºÅå°' );
  TableCode.Add( '}4xÃ%w*^PLgT-ÍCDı8ÕFmÈOsèRkIaVyİSWãGZáê\BoYdX.;<éÀ]Mj{[l/~J!É?ÊÌ7çòÁiv)5ì@â:c|íõeÙ6ùHQEN>pb,ûzó©=Û+ôqÓÔ®Auà2rU(#nÒú3Ç§1 0ÂñKÚ_9Ñf$&htäèÅñÆø°''ª£¢åë¡ö²º"Ö¹ÑüÜË¿æŞ¬ş¨ĞØÄ³' );
  TableCode.Add( 'õÛãljGáN3Ù©P.C9wMO>yİnç8\RQ§Lm6 ÕÑ}/h?~Ôâ^2íbû)dH,eÌòca5vsôù{tìÃ®$4êÍK+:&(WÂÇÒu-z;@ÉàXk=_ñ%#Sıú!*xÁ0[è<YÀÚÓD1irfTpZ7IoF]AgJ|ÊEóéUqÈBVËëÄøüö''ĞÖ²Ü¢äªñŞş¹¡Ø°£è¬³¨"¿ÅÑºåæÆ' );
  TableCode.Add( 'v/eTl=#o*8pùÚbìKÀá+y{_WZ}V§hzâÉ ÈC;ÙÊ-ãè&Óı:Dô0)®q%67õFR349ê!a<YúHGXmÃÑtUxBÂskQ?MILçéNOn(Õ|àûwEóu@1ÛPjÁÇíÒò,>İf©~ñ\c$J[52^Arg.Í]iSÌdÔ"£ş°ÆºöŞ¢ÄÖ¹''èÅ¬ÜÑüĞø³ä¿¨å²Ø¡æëËñª' );
  TableCode.Add( 'eê;VUPá0<ÔzRÀWd2I(ÚçÃé}G>ÑTí8N®6sp^à|ûj:{=óHÛkDèÒa§úì1)Ù[#EohKgFSbô&ùyn,L/B\]Y*CÇfw%!ò$lâÌr©~ZxJvãMıtÍA4ñ+İ-.Oiu9XÈÊ7_Â3m@qõÉÁQÕ?Ó5c ¿Åñ¡öªåØ''Ä°ºü¨ÑÜæşèäŞ£²Ğ"¬Æøë³¢Ö¹Ë' );
  TableCode.Add( ',Jw>hÒ2éaeXêRtòÕ?.s7ú%ÂY*bìM-èv§jyLnKVô|#r]m3Ç!(^Nd\TıD$P{o&ÔZ<âÃÁ®GO5WÌ©ÓİcûÀàIfF+áAz U@C=ÈçÊ:gQu/}xóñõ;HÚ1ù_4E68lÉk9Û)ipÙÍíq~SÑ[ã0Bª''å"£ŞèÜ²ĞÄëä¢ÅËÑº¿øÆ°ñ³æÖöüş¬¹¡¨Ø' );
  TableCode.Add( 'lZãt;/LÍ©mRvg[®ôT7ê8>#ÕCÛsèÂÉ§VqSMcÊu^Gk{ù:dQÀÙàÓúo)hB4jzõa.5wI0i|]?K(xHí%páfréOyÃFDÇ+9XPÚYWó*~Jñİ&nÁ= ÈNÌ6ûÔ3â,Ñ<ò-2@}!b1ç_ıÒUAìe$E\üÖºª¨"ëäè³ØÜ''¹ÄñŞ¬°²¢£Æöæ¿Å¡ÑåøşĞË' );
  TableCode.Add( 'à~{.k4oÉy)YáGr^F|x#ô*qn8l,Eİ/è+ìj;I i:ù2Zé1AÂQRfÒdíU}B>bXLÑsÍMucÊ@û\gPta©Kóê§peò&ıÀ(õçHÇÔÛzÈ9!wúm%Ìâ<ÙDS[CÚ]7NÓ®J3$O06WÁ5_VÕÃ-Tã?=vhñªşø°"Ä¬¡ĞÅ¹äÆ£¢²åüöŞ¨º¿æÜ''èÑØëñ³ÖË' );
  TableCode.Add( 'Û|e5Á+Í$cÊ}õXKİ>Q;3[S_ns6BéN9{ìlmC4dúÕpU(íY©ho7\.ãÑzôDù)j=tFW8ZèR2Ú#iVàòñw®<^IOê!û?]1vMÇ*ÒÌkHÉ§rÃóÙ-gP&ÀL:ÈbxáqÓÔG%/ Eçu@a~âfÂ,T0JyıA¨²¬ÜÖ''¿ÆªñÑĞ"öºä°è£üØÅŞ¡³åşøæÄë¢¹Ë' );
  TableCode.Add( 'onUhÛ]ıÈ,7KPrõñ4NeTçs0W\3_}1!SÒV{D-İqG5àmÃzZ=IÔ6ôÀ<Éc>YCj®ûRAXÂÑuèdMOù|:[òú©JyHL;xÊÚ/vbã&áQ~9ÙâÕapwì%f^ÁEég$l?)#ê@(§íBF2Í.óÇiÌ+ kt8Ó*ä£²"³øÆ°Ö¡ñ¬ëüÄÑ¹ş¢¨åËöªĞÜ''ŞæÅºèØ¿' );
  TableCode.Add( 'rç5AtsÚÛèX?2mú_W8S&9âzoÒg0iJÌÕf6=I Óv\QG].Íóqw>}ñÉéOKb*RûÇU-N{ô|ÙeùáTD®~H!Eı^Áx<#/Ô7kcLì+nZÃu,ãMClòİÑ[%)ípV@©dàêPY:(ÂÀF;§ÊBÈ4õya$j1h3äş³¬åü£¹º²ØËÆÅÖ"ª°¿ĞëÄ''æöŞÑøèÜ¢¡ñ¨' );
  TableCode.Add( 'Móú8Ib zÓZ&lê.:BEx2VaÇfWg;j4wÁ>p069X({Y}Ùt*7ñJ?q@C)P-àÒÕcoHyı3~iGQõÀÔãâÛK+Ok5Fh^|mUnDçár#AÚ<ùôé1©§ìİíûÌÂ_RÊNuv!Édè\Ã$s®L/,Ñ=Èe[TÍò%S]Ëë²¡ö¨øĞåæÅè°ŞØÄä''şñ³Ü£¢Æ"¿Öº¬üª¹Ñ' );
  TableCode.Add( 'À2xS8ÊÍlwmÑ>®k~pCái3ÇO17UÉ9ñ§çXõbdy6=#^\oMÙÔQé/rD$VÕ,òF%RhÌí&0tãÂ©WÒcag-;JPLÈ:}s.Iv[ô!*fBTj5 (zKqÓNuèùn{_4H?êÚóì@ÃÁıG<|ûúYâ)àA+eÛ]ZEİ¡Å£º"¬³ÜåÄşĞæ²äÆŞ°Ë''¢ëÑüèöØ¿¹ª¨Öñø' );
  TableCode.Add( 'àL©ÒÓiFS}AZg(ÂÍ/n>0ÊH3%-cç:PlvRwã].ñTB&\WO78ÕÔÌÀkúòJxêudUÁÚé~IÙ_CÈtÛ=Épôıbjè+G?û)*faQ[@Yr94áóİ§z^oÃÑms5ì,;#<hâEV6Xe{KDqM1!ùyõ®ÇíN|2$ º¿Ä¬²æŞØ¨°ªÑ¡''ñüÖöĞøÆÜÅ"£¢Ëåşëäè³¹' );
  TableCode.Add( 'Ñ;c&áÚÙÕ=QKòYkNÛ)Éx$ó/émSÇ@ÒhTFq#À§2roÓl8G7ãsz^Ídvâ~1ì,3VÔMùjR0wp-uBİ+IÊ:nH}?5OõÈy\{C©çÃ%Xfô*®Â6úgètaiAUED]ıíZLPû<4bÁê_Ì [à>WJ(9e|!.ñ¨¡Ñ²¹ë£''è¬ªü³ÖÆÅ°Ë¢å¿"öşäÜøŞĞºæÄØñ' );
  TableCode.Add( 'vdÕ[ìG=ÉpÊAtLóqí*!Ûàéc;JúáaHhÌxÂÒb3)Tj|BW]ıK4D75_:YlF~Çuù@û/k{r<ôÙ®UOês\Q6Í©X>8Ô§?SòMãPfÑV$2%RİÀgnè^ÓZ+Ú&ÈIoâÃ #0.}y-Nme(Áç,izw9ñõEC1æ¢¡ñå²ÑöÄ¨Æë³''ŞÜØªø°¿ş£ĞÖ"ü¬äèºÅË¹' );
  TableCode.Add( '!E@Smg^ú,?/frbñDôVG[Áj=Bopl}Ç8â-Úè©Oò)û\+ã1®.ÒwÊİùLéKqZ{Àkv§zWdhÃÈìTÓáÑõ(N6n*&Q>%HPÕêÉÌ;A3MJYx|í:cFR]Ià5X~U#ÛÔyó$9uÂ0eaC7ıiç42Ít_Ùs< ¡°¿å²ŞÜ¹ÖØ''Ä¢¨è£ñ³øºËÆª"äö¬üëÑæÅĞş' );
  TableCode.Add( 'h<ñOûÉ~Q{bKúsóUÛ&ìmõH}§nJáGÙ5Ç_M%)ÂVÓ9ÌfSiyN®>íIù|=\xÈ1?İç6zÍeTu:èW,8t;*ãFpgô7vBÃwê/$C.@YZkÕıR[Ú+]Á!r#àcA XLéò4lPâ-aÑÒ32Ôo0dÊq^ÀDjE©(º¹æ°³¿ÑÖÅ¨ëöÜ²¢ªå¬£Øş"''èñ¡üÆøÄĞäËŞ' );
  TableCode.Add( '5+Cyau&AâhZloIÑq*ÁvKs3ÀYw#UàDGd)Ó;\]@tÌ.õ|cn/!ÈpTJôéóEê}WS^Ûò,mÙj<-({§çzrı~O4èÚ?FÍHÕ©Ò6>$XÃxúi0ûLù%:e1kİÇB8g_Qìf9VÔbíP7®á=MÂ Ê2NÉñRã[æ£ÆªÄ²ñöĞÖ"Ü¬°¨Øå¡''³èşäøëºü¹¿ŞÑË¢Å' );
  TableCode.Add( 'sxedRhXD/záTv&ÑOa<Yo$wH;IjÂ§tn)qñEmérÓÕÇÉ®ÁA9ù-õÌ+!^_yNU2}%.íìÒ3ÍPlúG 4:Úç@5ıó\Ûb87L]Zà#1À~QÔFâ>[S?fMê|côCû,WKãİug*6(pi{=òkJÙÈÃBè0©VÊ°ËØå£¹¡şäĞÆ''²øÑ¨ÜæñŞÖëèÅÄª¿³ü"¢öº¬' );
  TableCode.Add( '>2@ÓN{]zDStQbú|wo\m(ÈÃ9PÙ_[6rÉqXA!Ç)7À?êÑL^xRáèíé§0çj-g}T/ÕYs:ìHhM%V+npÛi4Gİóf;ÂÔ~FW#âkv©Càı&KÒ,õûÍZJIcô=Oùy3®Ê1$ÁUÌl5aãuñeE.8*ÚB d<òëşÆºæÅå"¢ä¨¬¹''ü³Ø¡Ñ£øñÄöÜÖŞ²¿Ë°ªèĞ' );
  TableCode.Add( 's©zlÚÂÊOáéõì6ûÌC9wàíÓÃâ)ÑkÈ-|<Òñ®§&_8yãnuTdqZoV]%4ÛMKUe#}ÔhAfİW3ÀLôI\ç[5/Á.= XÙGP0Õ!ÍB;:{2?Júxèóa+ı(ùcj^QmvYNSêi@gRDp>t,F7rÇ~Ebò*É1$H¢Æ°ä¡ŞæÄÅøªë³ºş¬²¨¿''ØÜñËĞÑè¹å"öÖ£ü' );
  TableCode.Add( '-}èêI09X.È^@~bàP_i<CgJTWcÌõGRÁÔULsı|VáÒùÉAÙñDíÊ{,u(jSãM:ÕÛİ[YQé>óâ/Ñ$ \Ú6rôoKì8pmn2h+=5)kÃvòxNç73fEBû©qeZÓ®ÍÀ1*#zO]a4wÂH§?&!y%Çú;FtldÖ°ş¢¬æö£ëñä³Ëø''¿Ä¹ÆĞ¡èªÜŞØÑåü"Å²¨º' );
  TableCode.Add( '>ù,m3XİejO9Rq[DÉl1Tioó).wÍsh}<UÀÁy6ô]gÒ7/JG{2@ê*zâÊ§+Ú5S K-àÇ|V#Zû40©è^t(fávÈd:Fì~ÙBò;®ı!&Ô=NcQaÓÃéÛçñúWI?M%LpxknÂÌHíCÑY8_$PAuÕã\õEbrÄØĞ£¨şæ³º¡²ñèÖŞ''¬ÅöüåÑøËÆÜªä¢°¿ë"¹' );
  TableCode.Add( 'T,V^GiZk>7â4f1s§yñû}Ñ[Í*LÂD=á.ìEõq%çãFÛhí&XdÊSl(ÇQ!u©rô®wmÁOM|Ó5UİúÉje8èp{ınxPé+3KÕÀ H~à-CIAYR?)toz0#cùÔòNÈÒbê_$]vgaJ\Ì<Ã/ÚW:;29B6Ùó@ÜĞ¢¡Öªşå²Äº°³ñ¿ü¨"ö''ë¹ä¬ÅÆæèØŞ£ËÑø' );
  TableCode.Add( 'hfé%FQÉg,ÍÙÂNÌÒ;xYíKWAs&ÀHúCi=nEçÃJuUñ3GÔz_TÊ4)DjÕà0@81Lm©Zá$ìX[/BÚ |ô9dqê®eÈ!a({l\§:~âb-pİRòè#y*k^5ùS?Ñt.VıwOr]v7PIÛ<oM+ÇÁ>ó}6õcã2Óû¡ëö³£şø¿''üªèæÖå"Å²Æñ¹¬ºÄ°ŞÜÑĞ¨ØËä¢' );
  TableCode.Add( 'ÙóHy?Èôù>ÌSìí)4MvúÑãÊÂxjıbP;/®Í7(8]D_%\ÉiEheq,&A[ÁCoIé@©f<|sÀÔ-Jd3#a5WÕkGûZNàÇ:wVORÛ2FQİ=YñânÓ^rõK! Òç0ò6tcUáÃLzÚg$~ê.l1B}*Xmèu9{T§+pèËØº¨Öæªñ³ş¹"ü¿£ŞÅ¡ö¢ë''ÆÑÄäĞÜ²ø°å¬' );
  TableCode.Add( 'kıC7ixêzpÍ@^SÀs!ó[áj2#hû*ñÈX<RH3n}(§-/JòàUFeMèÌO©éÑ:|Q?b\TÛK5f~õ%ÉBN9v$,ôÂdríyaâÁwV.ou=ì>Zt&ÊqÓç1ÙDùlÚÇ6{ÃYÔ+;cİL_W0Ò4I EAúgmPGÕ®]ã)8£è°ÄĞºñÅ¹Ñå²"äü¬æ¢øÆØ¿¨Ş¡''³ªÜËÖöşë' );
  TableCode.Add( 'JF!a1ıÉ LÑuÂÊQCÔ#$8®_Umâ6KÙÇÀ/?TGh20-A\%Û§ãè+e>:I@dESÃñÚôtbz5r)úêj{©]pBàõ.RZ}Ó~ûsPvNoY,ùn9xé|<Vq3ck(gH7^lw&ÒçİyOáóD=ÕìòM*fÍÈX;iÌÁ[Wí4°¬ÅåŞÖøèØªÆ£¿ñ¢''ş"ÑæË¹ĞÄÜëü²¡³ºö¨ä' );
  TableCode.Add( 'Lbó>IBOÒ4RÙ:ÔoKİUñÁÕ}nHGd!ıXàiÑ,á/íe8VÈè&Çù2q[rD0À{\ux©lû17hNôãEtF(éf%aj#P§ÂJ^_C9yÛúw)õY6<Q]+TâkmÍZ@A-*S Ãòê.$ì|vc3ÌÚçs=5p;W®MgÓ?Éz~Êñ"åø¢°è''Ğ£¹æË²Æ³Ñ¿ºŞäØÜÖüë¡şªÅÄ¬¨ö' );
  TableCode.Add( 'l%ÍJ.pZ+2dj(*]cô~);Ó<ÚàúuùVûÇ6wMzñmy:^ê}W/ãUK_-AçÑè!XÁ§LQoOiòÕ®ÈÔG[4CéÉST@1H?Ûí|I$ÒáNxBY#3Ì9İa\©{ÙD>tõEó8&PRbks ,FÀÃ0q=vâ5f7rgnheÂıìÊËº²ªÑ¿¢Ğ''³£æëÅä¡"şåÖèø¨ÄŞÜö¹Ø°ñÆü¬' );
  TableCode.Add( 'bg$~ !Ãet?Y:}®c\ÂèoÊkôQ@ÛÒGDuNHÉ,SvI7^ò>Íúİ5Ó{FsRa*K.j+-6íÁB3|9Ú1xáV8[/_ylÙzómâdrõ©ûÕL&JOAfiCùp%ÔãÌÑ#;TP=éXUhnıê0çMÇ<4)àÈÀ]ìwW§Zñ2q(Eü³"Ü¨ØÅë²ñŞÄşĞ¢ª£''Öº¡¹¬Ñæ°Ëè¿åäøÆö' );
  TableCode.Add( 'ÇxÑç3pGóe<tfêNFn~ñz&_%ò*Z(|5ToıQgã©07ÚÈÀÃJi,WC:YÍ#Ó>4Bù2O@/ .u?yÁÛ}ÔÙA-KRc\é{rjõ$úE[dÌ;mk®íÂIwbMà)ôâPXì!V=Õvqè9ÊÉ§a1sİ+8^U6HlÒ]DLSáûh"Øåöü''Ëäş¢¿æÄºñÅ³¬²ëè¨øÆŞÑ£°¹ÖªÜĞ¡' );
  TableCode.Add( 'ì2lZda8>úÂ(tP%ıVf?i)ôI#ÓÌJ6o{/AÑÁÀNÊ}§|3sSn!D&0QUwmÉHqõ +Õ=XÚjñé^âãÙbèMêí7_çvh~zpC©;rg1]áOTkÇy,BY$Ã9-È.àûx\ÔR4F®<cuWe:ÍKİ[ÒòLù*óGÛ5@EÅëøü£''èÖºñöÄª¬Ñ²æ¨Ş°³åÜË¿şäÆ¹¢"Ø¡Ğ' );
  TableCode.Add( 'Íc9.RõxgUÀ)oÛ<V(è0TK>®úh+|áİ;SXìz&òÊFeEdíô%ùÚuó\WD?G©Lñ@k~Ôı*[ÃQvéài6]ÓêOJ^/lÁ:bMYZqBÙ§r PÇ$},N#35Ñ4twAf2p1sç_jHIÈC=a{û8ÕmÒÂÉã-â7n!yÌÆËäæ°ñÑüø¢''ëÅåèºş¡£¹Ü"Ä³ÖĞ¬¨öª¿ŞØ²' );
  TableCode.Add( 'BÒ:ÇN*?VU|^zÊ$]qZCÕb,jÃStYoQ)5\I=iv[êò§OÁLÛõTukâlñs6Ñà8ìÍíÉme(;+ãó~ÈaG0h/İyc©Ùù12_#gnèf7!éÌ Ôô9Fı4pÓçX{úrPx}R>@H.<Jd&DáW-ÀAÚwEÂ%®û3KM³üØæ²¬"ë°ÑåÆñö¢ä£ş''¿ÖŞ¡ªĞºÄø¨¹ÜÅËè' );
  TableCode.Add( '!RlF-5õJoLQìâÊÍ*à~ZÇg;ín6AİÁsKjû\PÉá&IUxñò0Dz.#uÙi_hó,SıÃv=r§yp<©q$N37C2^1ÔÈmVÓ)ÀYkGHÑ4éXÌBtbç8d(Õ9Û:ôÒú>%+@?]è®[ãÂ{OT MafÚ/We|êwù}EcüŞöÑÖ°ÄØ"º²£¬³¹¨ªåşÅĞ¡Ëæ''øèä¿ñëÜÆ¢' );
  TableCode.Add( '>®4Ù.SóDÃgEñF]jZT _CíJıuiQRH!~^K1&\%}Õ0É,t§úeôpmûÔ/<c©Ó${)|éhqÀX-èBAM95Âà=vO*(sYl?LÊfáo8ò;r:xGê[âÇùÑÚ#çìa2Á6NnVÒzÛİ7bWwPdõÍ+ÌI@UÈ3yãkªºñ³¿¨ö²åü''¬Ñøä°ÆÅ£¢ØëÄÜĞÖË¡èæ"Şş¹' );
  TableCode.Add( 'l#ì%CEàÚrÂÛw_iÕ3*![ıç<®èÌxIA:(Ñò~]aÓNYPOcgZ§yÒÙKÍM&d)ôÇzİGíUÁ|$v5È=ÊJ{ÉñphÀm©Ô.,Ln2sõúHùt?Rfb-ãe6ó;âouX8éq êûS>B7QD1VF9+4}Tk\0Ã@á^/jW''¡şÜËöŞÄÅåÆ¬¿²øëüØ¢Öè°³Ğ¹äæ£ª¨"ºÑñ' );
  TableCode.Add( '~{Û(&\l,Í5mhÚ.c0o<ìÊÔEÈ/ò$íàç[sãq*v@=SyÂûô®)Lùın826]fÃK+ékZwBÇaÌ3FT}:IÁNVñAR-XõU Y!iDrW#xdİbáj9eú%^4è|À?>GóÓÑQt;PâgJ©pHu7Mê1_ÙÕÒCÉ§zOüÄş¹Üæ¡å"ñŞ¨Ø¿Ğ°²Æ¬öÑ¢''ëÖÅäËº³øªè£' );
  TableCode.Add( '§|mônç0N^è(pUù9$Sz#VqÌ®Ò/Õx2:ÍHI)hÉYá-6vÇìİXaÂ5l>Ê,<àÙjõtJûLÁúBòdDíâbk7}éTgÃ{e&Ûı!+Ú=Pwñ4KurG31AFO@\ ÀMWCQêó?©8;È][Ñy.*fãÓcZi~R%EsÔo_°ÖØäÅ£Ğ¹öëüªşÜ''ñ¢ÆŞÑ²¡ø¿æËº"è¨¬Ä³å' );
  TableCode.Add( 'Ñ<voúÓTD$Êyé+EâG|2ÇãzBhÌ8êl5;f)õK\NU,Áçg]_~^İ.ìjèÕXSc[%P&ZÍHís4Cù6wt!rV#{/mòÃ-M*Èıàxû0ÂÉÛ@pÒeôL:a>Jó3áF1nibk9Qu7I®À?dRÚqÔ}AÙñ=Y ©(WO§¢Ëş²''¡ö¨°ø¿ëªüñÄåĞ¬Øè£¹ÖÜºÆÅÑŞ"æ³ä' );
  TableCode.Add( 'J,P$1ì§!/{úİ5?@k<nòM0Õ[=ÛÊhLYVÓODvÚ>3-Éq\ZsãGAjXàèE&dQK(6)lçÑÒmoaûÙ+BcieNWÔâù®f7õzCıxáÁñ Ç©éôwIÍó]ê9.FÈr|Â:S_RíÃy%Àpg^8}2Ì~uH;b4Ut#T*ö¢üÆåÖäË''ÑĞª¹Ø¨şÅ£°ºèø¿¡³ñ"¬²ÜæÄŞë' );
  TableCode.Add( '®èjÊ8]Zçyn|ôÃÉe.}c$TLñÑMÈıQYÍòíÀ%>&;+ÂêÔxN=^JSVPE3O@a_ R0gw!qÁá,Ú§Cú<Aìvã(Gù©âàFmÛéBhÌo#Ib\?r[ÇXu1ÕÒ*ósf-{d:İl7~ti6/p4zUÙõ5kKHDÓ)ûW92Öş¹Åñü²¢öĞº¿ª¨Ş''ÄÑÜ£ä¬ëÆ"°æåØøè¡Ë³' );
  TableCode.Add( 'twGv^Y*ÇML+ =P-Íg[Óeê7Wbdo§Ô<HèIóBThjU%:úxcrÀSÕ>q2RÈpDiV@éKí}E]QC8®$ãÑ|lò3uÂ!1syıOÉXNÊìñ05;&_ôâk(\.A)Ã~õàç/zmÚÒÛ9Ì{#a4ùÙİûFÁ©Znf6J,á?ü¿ö£Ëø°Ü³ØºĞæŞş¨¢Ö"Äëè''²Åñ¬Ñåª¡Æä¹' );
  TableCode.Add( '*.0É43a<vpÓoì§i]T+Ô®ûbgÙUsYí&İùI7ıõ©òÃÁ\wS@1â:Xx?Í_,$yèkhç6ÂéÑãJrMtB/R{Ç5WfÌ~F|á2nGmN-^àÒ)PLeôOAHÛlZêzdQ}ÕóCc8ÚV[u!Kñ;ÈD(jq%>À Eú=9#Ê''è¬Ñ³ÖĞŞøüÆ²ä°£¿Ä"æ¡¨¢ëÅşöºÜØ¹åªñË' );
  TableCode.Add( 'VÙ3]|JcêZó{èfç.8ìjDSÂám_-ÀFÔâHq ^xOÉ$Nb§7UÑ@%!ÕP~:+0Èôa9,(®hàA/?<oéeõsykXW)İÌ4pLÍYñzòRÓi21ùCúÁÊÒÇ}MÃG=#Ev\;rg©ldIãwuQtBnTKí5ı[6>&ûÛ*Úş''Ñäö²º°¿³ªËÄØÜ¨ÆŞ¹¡åèĞü¢ñÅ£øë"Öæ¬' );
  TableCode.Add( 'An+fwc^ÊçT(é-ÚM]õÂÇ.6í|;Ûá2Ã! >N_§&Òmã@</ô~,êOı5)G:tàKbjÀ[ÙÔâ$usWÓJLVÉg7PXñÈóiaZy8RY}Qe4İÍ#oÌûhòH\=lzBúCkDv®ÕÑ%S?p*qFEdèùÁx31©ìrI09{UÅèö£æ³Ş¡¨şøªÖ¿''ØÄ°Ü¢¹Æºñ"²äüËÑĞëå¬' );
  TableCode.Add( 'ãòÊÛZi)QvF0!=ú{Õq,a4İÉ~k2j/UõÍRìèáCÌ.$[GfBOíô#SêtéñÇX^oYı@TâwÈVu&ûÑ-À%ÂD1I(r?HÁÒ9M6dhù KÓ\LJ+:*s|]§zN;®<óP©}eàp7myg8_Ô>x5ÃbÙlÚ3çcAWnE°ö"èä£ü¹ØŞ''ş¢ªÖÅÜæå³¡ÆëÄ¬ñ¿ÑºøË¨²Ğ' );
  TableCode.Add( 'o/{ûHùaáQÉ8àFBâvLd%WU2$ÂãS[Ò#JDêAbtòıÁİT®;xi.l)5ky!Rç©óhÀ9@Ó ÚfI}cÍÃ>ôzì\*Ñ~:MX4&Z6w,Yè1Ìq?jÇrÊC(õ-]eKn7pñ^=gíÛG§Ù+<P|úNs_u3ÔOE0VÕméÈ²Äå¢¬ÜëŞº¡ÆËöäØæĞø°Ö³ñşü¿"''Ñèª¨¹Å£' );
  TableCode.Add( 'DÀf1@Ì/v&sSGK<qE:Hyı6-kiT}éOÕ.Ç;gM^F(z_\û2Èd+V§®9aÔÊô3#eJÚrİpÁÉPb7 0?RuYX8àÑò%W$íõùáÃlÂÛIÒ{BnÓNÙtóC©,xcêL~]Ímú|4Z)QUñhìwèçãâ=*o[5!>AjØ¢Ä¹ñëÆæå¬öÑ³¨èø²ÅŞüĞË¡ş£ä"''°¿ºÜÖª' );
  TableCode.Add( ' İUT®,!CÍRÀ(ñ©Ó5ò.4X$w7%&/ùólçôÑFÉ2yr3v6<dIÃ@x^;NÁ8-é=Lp>Esàc\Z0È+9|]a[zÔfãobúâ~WA_ûÕD{Vgí)KeÙm?Q§YHO:qkPÂìtõhÚBÇJÒn*êMèá#SjÛGuı}iÌÊ1üşË³Åæñ¹Äø°è¢äÖ¿²å¨ŞĞ¬Ñöë£ª''ØÜº¡"Æ' );
  TableCode.Add( 'ç§_d[D^è:!ÀñUz]gÑuâo<MK®sBL&(Y84epÔ2v0X*rx1ÉÍÌF+n©AWT/QêİV{mÊÂÕy-b~õÁ)9.Z|ôùàH}ıI=3Sci\;a?íì5>@7NÇqÒR$tfwhJ#éÙóákÚòÃO ÈPúC%ljGã6ûÓ,EÛÅ''ÄÆØ°£¬²Ë"³èº¨ªöüëÜøæ¹åşÑŞÖ¡ñä¢Ğ¿' );
  TableCode.Add( 'j@$lID(bôsBèÌù+YXú#][qmÃÓ,PñvN2)>!§àãMZ6<íVg©9ÕpìHÚ=_~L eAw-fCcÙJrêÈÛâ4ÂTdnÊç\õ17oÉ0OQò^{Ò&*}3óáEUFG®éÁ|R?:hkİtW/xSû;.ÑuaÔ8%yziÀ5KÇÍıëÆª²¨øºèÄËş¿Ş''ÑÖ£Åå"üæöñ¬¡¹Ü°Ğä¢Ø³' );
  TableCode.Add( ';L>ÊÙOi[ó|à8*ı9mW:?\ÓİhBìÑj)JÒÛú2RÚE$ùc1#lè0í~St@eXÈpâIÇ_ôk©Qz4.êûÉTM] n§<,+Á^w!GÔF&qgf®=ÀÌéÃYÕAKyñasV3D{ã/u7Í-b(ÂvçdNorP%}HõC5áòZUx6è£¬öÑşøü¿äº²ñªËæ"åÖØ¢Ş¨ÄÜ°¡ë³ĞÅÆ''¹' );
  TableCode.Add( 'êHo[}ÀÉú>Áâ~b!wí9OánñÊ=&LÙaıiÒÇqé0MXÕgz\İ-2)hFãD$ôÑ^7jÍ_G.8TU#4Põ{6RduEQtè]|31Ãû;Ì%(çÔxkàlÈùóK®§fC/ìÚyZ ?J5ÂÛeBS@csAÓ,*N<vVò:pIm+©WYrËäÄñÑ°''º¹Øë¬¢ĞªÅ"şæ¿£²ü¡ÆöèÜø¨åŞÖ³' );

end; {Create}


destructor TCMCrypto.Destroy;
begin
  TableCode.Free;

  inherited;
end; {Destroy}


function TCMCrypto.Procura( Linha : String; Ch : Char ) : Integer;
var
  i : integer;
begin
  Result := 0;
  for i := 1 to length( Linha ) do
  begin
    if Linha[i] = Ch then
    begin
      Result := i;
      Break;
    end;
  end;
end; {Procura}


function TCMCrypto.CMEncryptChar( Charac : Char; Key : String ): Char;
var
  Pointer : Integer;
  Cript : Char;
  Linha : String;
  lin, col : integer;
  StCh : String;
begin
  Pointer := 1;
  Cript := Charac;
  while Pointer <= Length( Key ) do
  begin
    lin := Pos( Key[Pointer], ValidChar );
    if lin = 0 then
      raise Exception.Create( 'Caractere inválido: ' + Key[Pointer] );
    col := Pos( Cript, ValidChar );
    if col = 0 then
      raise Exception.Create( 'Caractere inválido: ' + Cript );
    Linha := TableCode.Strings[ lin - 1 ];
    StCh := Copy( Linha, col, 1 );
    Cript := StCh[1];
    Pointer := Pointer + 1;
  end;
  Result := Cript;
end; {CMEncryptChar}


function TCMCrypto.CMDecryptChar(Charac: Char; Key: String): Char;
var
  Pointer : Integer;
  Cript : Char;
  Linha : String;
  lin, col : integer;
begin
  Pointer := Length( Key );
  Cript := Charac;

  while Pointer > 0 do
  begin
    lin := Pos( Key[Pointer], ValidChar );
    if lin = 0 then
      raise Exception.Create( 'Caractere inválido: ' + Key[Pointer] );
    Linha := TableCode.Strings[ lin - 1 ];
    col := Procura( Linha, Cript );
    if col = 0 then
      raise Exception.Create( 'Caractere inválido: ' + Cript );
    Cript := ValidChar[col];
    Pointer := Pointer - 1
  end;
  Result := Cript;
end; {CMDecryptChar}

function TCMCrypto.CMDecryptStr(Str, Key: String): String;
var
  iPosicao, iTam, Cont : integer;
  Ch, ChAux : Char;
  sLinhaDecrip : String;
begin
  iTam := length( Str );
  Cont := 0;
  sLinhaDecrip := '';

  for iPosicao := 1 to iTam do
  begin
    Cont := Cont + 1;
    Ch := Str[iPosicao];
    ChAux := CMDecryptChar( Ch, IntToStr( Cont ) );
    sLinhaDecrip := sLinhaDecrip + CMDecryptChar( ChAux, Key );
  end;

  Result  := sLinhaDecrip;

end; {CMDecryptStr}


function TCMCrypto.CMEncryptStr(Str, Key: String): String;
var
  iPosicao, iTam, Cont : integer;
  Ch, ChAux : Char;
  sLinhaCrip : String;
begin
  iTam := length( Str );
  Cont := 0;
  sLinhaCrip := '';

  for iPosicao := 1 to iTam do
  begin
    Cont := Cont + 1;
    Ch := Str[iPosicao];
    ChAux := CMEncryptChar( Ch, Key );
    sLinhaCrip := sLinhaCrip + CMEncryptChar( ChAux, IntToStr( Cont ) );
  end;

  Result  := sLinhaCrip;

end; {CMEncryptStr}


function TCMCrypto.CMEncryptFileFromStringList( FileTarget, Key : String; Source : TStringList ) : Boolean;
var
  linha : Integer;
  StrListAux : TStringList;
  sAux: string;
begin
  Result := True;
  StrListAux := TStringList.Create;

  try

    for linha := 0 to ( Source.Count - 1 ) do
    begin
      sAux := CMEncryptStr( Source.Strings[linha], Key );
      sAux := CMEncryptStr( sAux, IntToStr( linha * length( sAux ) ) );
      StrListAux.Add( sAux );
    end;

    StrListAux.SaveToFile( FileTarget );

  except
    Result := False;
  end;    

end; {CMEncryptFileFromTStringList}


function TCMCrypto.CMDecryptFileToStringList(FileSource, Key: String; Target: TStringList): Boolean;
var
  StrListAux : TStringList;
  linha : Integer;
  sAux : string;
begin
  Result := True;
  StrListAux := TStringList.Create;
  Target.Clear;

  try

    StrListAux.LoadFromFile( FileSource );

    for linha := 0 to ( StrListAux.Count - 1 ) do
    begin
      sAux := StrListAux.Strings[linha];
      sAux := CMDecryptStr( sAux, IntToStr( linha * length( sAux ) ) );
      sAux := CMDecryptStr( sAux, Key );
      Target.Add( sAux );
    end;                 

  except
    Result := False;
  end;

end; {CMEncryptFileToStringList}


function TCMCrypto.CMDecryptFileFromStringList( FileTarget, Key : String; Source : TStringList ) : Boolean;
var
  linha : Integer;
  StrListAux : TStringList;
  sAux: string;
begin
  Result := True;
  StrListAux := TStringList.Create;

  try

    for linha := 0 to ( Source.Count - 1 ) do
    begin
      sAux := Source.Strings[linha];
      sAux := CMDecryptStr( sAux, IntToStr( linha * length( sAux ) ) );
      sAux := CMDecryptStr( sAux, Key );
      StrListAux.Add( sAux );
    end;

    StrListAux.SaveToFile( FileTarget );

  except
    Result := False;
  end;    

end; {CMDecryptFileFromStringList}


function TCMCrypto.CMEncryptFileToStringList(FileSource, Key: String; Target: TStringList): Boolean;
var
  StrListAux : TStringList;
  linha : Integer;
  sAux: string;  
begin
  Result := True;
  StrListAux := TStringList.Create;
  Target.Clear;

  try

    StrListAux.LoadFromFile( FileSource );

    for linha := 0 to ( StrListAux.Count - 1 ) do
    begin
      sAux := CMEncryptStr( StrListAux.Strings[linha], Key );
      sAux := CMEncryptStr( sAux, IntToStr( linha * length( sAux ) ) );
      Target.Add( sAux );
    end;

  except
    Result := False;
  end;

end; {CMEncryptFileToStringList}


{
procedure TCMCrypto.DebugToFile(sStr, sArq: string);
var
  sList : TStringList;
begin
  sList := TStringList.Create;
  try
    try
      sList.LoadFromFile( sArq );
    except
      sList.Clear;
    end;
    sList.Add( sStr );
    sList.SaveToFile( sArq );
    sList.Clear;
  finally
    sList.Free;
  end;
end;
}

end.

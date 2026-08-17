{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18
Pendência   : 28168
Responsável : Daniel Simões
Data        : 11/06/2008
Descrição   : Retirada /*+RULE*/ das querys do relatório...
--------------------------------------------------------------------------------
Pendência   : 15696
Responsável : André Tavares
Data        : 23/12/2003
Descrição   : alterei a query qryAtendente.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FPRelEstatDetalhada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery, CMDBLookupCombo, usistema, uModulo;

type
  TfrmPRelEstatDetalhada = class(TfrmOkCancelar)
    dataini: TCMDateTimePicker;
    datafin: TCMDateTimePicker;
    Label8: TLabel;
    Label7: TLabel;
    RgOpcoes: TRadioGroup;
    qrypatro: TwwQuery;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    cmbpatro: TwwDBLookupCombo;
    Label1a: TLabel;
    qryfilial: TwwQuery;
    qryfilialNOME: TStringField;
    qryfilialIDPESSOA: TFloatField;
    cmbfilial: TwwDBLookupCombo;
    Label29: TLabel;
    qryatend: TwwQuery;
    qryatendIDUSUARIO: TFloatField;
    qryatendNOMEUSUARIO: TStringField;
    cmbatend: TwwDBLookupCombo;
    Label2a: TLabel;
    qryassunto: TwwQuery;
    qryassuntoIDASSUNTO: TFloatField;
    qryassuntoNOME: TStringField;
    cmbassunto: TwwDBLookupCombo;
    Label3: TLabel;
    QryGrupoAssunto: TwwQuery;
    QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField;
    QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField;
    CmbGrupoAssunto: TwwDBLookupCombo;
    Label12: TLabel;
    cmbstatus: TComboBox;
    Label6: TLabel;
    qryformaatend: TwwQuery;
    qryformaatendIDTIPOATEND: TFloatField;
    qryformaatendNOME: TStringField;
    cmbforma: TwwDBLookupCombo;
    Label4: TLabel;
    qryLocalAtend: TwwQuery;
    qryLocalAtendDESCLOCALATEND: TStringField;
    qryLocalAtendIDLOCALATEND: TFloatField;
    CmbLocal: TCMDBLookupCombo;
    Label11: TLabel;
    QryPlanPrev: TwwQuery;
    QryPlanPrevNOME: TStringField;
    QryPlanPrevIDPLANOPREV: TFloatField;
    CmbPlanPrev: TwwDBLookupCombo;
    Label9: TLabel;
    QrySituCad: TwwQuery;
    QrySituCadDESCRICAO: TStringField;
    QrySituCadIDSITPART: TFloatField;
    CmbSitcad: TwwDBLookupCombo;
    Label10: TLabel;
    qryCidades: TwwQuery;
    qryCidadesNOME: TStringField;
    qryCidadesIDCIDADES: TFloatField;
    qryCidadesCODESTADO: TStringField;
    qryCidadesIDESTADO: TFloatField;
    qryCidadesIDPAIS: TFloatField;
    qryCidadesUF: TStringField;
    dblkCidade: TwwDBLookupCombo;
    Label26: TLabel;
    rgrpExibir: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TotalGeral, percent : Double;

    iTotalTempoMedio : integer;
    iTotalTempoTotal : integer;

    procedure Totaliza;
  public
    { Public declarations }
  end;

var
  frmPRelEstatDetalhada: TfrmPRelEstatDetalhada;

implementation

uses DRelEstatDetalhada;
{$R *.DFM}

procedure TfrmPRelEstatDetalhada.bbtnConfirmarClick(Sender: TObject);
var
  sSql, sAux : String;
begin
  inherited;

     if rgrpExibir.ItemIndex = 0 then
     begin
       dtmRelEstatDetalhada.ppdbTempoMedio.DataField     := 'MEDIA_EM_SEGUNDOS';
       dtmRelEstatDetalhada.ppdbTempoTotal.DataField     := 'TOTAL_EM_SEGUNDOS';
       dtmRelEstatDetalhada.ppdbTempoMedio.DisplayFormat := '0,## s';
       dtmRelEstatDetalhada.ppdbTempoTotal.DisplayFormat := '0,## s';
     end
     else
     begin
       dtmRelEstatDetalhada.ppdbTempoMedio.DataField := 'MediaFormatada';
       dtmRelEstatDetalhada.ppdbTempoTotal.DataField := 'TotalFormatado';
       dtmRelEstatDetalhada.ppdbTempoMedio.DisplayFormat := '';
       dtmRelEstatDetalhada.ppdbTempoTotal.DisplayFormat := '';
     end;

     if not Sistema.GravaLogOperacoes('Oper. de Consult. do Relatório Estat. de Atend.') then
     begin
       Raise Exception.Create('Não foi possível Gravar o Log');
       exit;
     end;

     sSql := '';
     sAux := '';
     dtmRelEstatDetalhada.qryFun.Close;
     dtmRelEstatDetalhada.qryFun.Open;
     // poe o filtro de datas
     if dataini.text <> '' then
       ssql := ssql + ' AND AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') ';
     if datafin.text <> '' then
       ssql := ssql + ' AND AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') ';

     if (dataini.text <> '') and (datafin.text <> '') then
       dtmRelEstatDetalhada.periodo.Caption := 'Período : De ' +dataini.text+ ' Até '+datafin.text
     else dtmRelEstatDetalhada.periodo.Caption := 'Período : TODOS';

     if cmbfilial.text <> '' then
     begin
       sSql := sSql + ' AND EL.IDESTAB = '+cmbfilial.lookupvalue+#13#10;
       dtmRelEstatDetalhada.Filial.Caption := 'Filial: '+cmbfilial.text;
     end else dtmRelEstatDetalhada.Filial.Caption := 'Filial: TODAS';

     if cmbatend.text <> '' then
     begin
       sSql := sSql + ' AND AT.CODATENDENTE = '+cmbatend.Lookupvalue+#13#10;
       dtmRelEstatDetalhada.Atendente.Caption := 'Atendente: '+cmbatend.text;
     end else dtmRelEstatDetalhada.Atendente.Caption := 'Atendente: TODOS';

     if cmbstatus.text <> '' then
     begin
       sSql := sSql + ' AND AT.STATUS = '''+TRIM(cmbstatus.text)+''''+#13#10;
       dtmRelEstatDetalhada.Status.Caption := 'Status: '+cmbstatus.text;
     end else dtmRelEstatDetalhada.Status.Caption := 'Status: TODOS';

     if cmbforma.text <> '' then
     begin
       sSql := sSql + ' AND AT.IDTIPOATEND = '+cmbforma.LookupValue+#13#10;
       dtmRelEstatDetalhada.forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
     end else dtmRelEstatDetalhada.forma.Caption := 'Forma de Atendimento: TODAS';

     if CmbPlanPrev.text <> '' Then
     begin
       sSql := sSql + ' AND PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue+#13#10;
       dtmRelEstatDetalhada.Plano.Caption := 'Plano: '+CmbPlanPrev.text;
     end else dtmRelEstatDetalhada.Plano.Caption := 'Plano: TODOS';

     if CmbSitcad.text <> '' Then
     begin
       sSql := sSql + ' AND SP.IDSITPART = ' + CmbSitcad.Lookupvalue+#13#10;
       dtmRelEstatDetalhada.Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
     end else dtmRelEstatDetalhada.Situacao.Caption := 'Situação na Fundação: TODAS';

     if cmbassunto.text <> '' Then
     begin
       sSql := sSql + ' AND ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue+#13#10;
       dtmRelEstatDetalhada.assunto.Caption := 'Assunto: '+cmbassunto.text;
     end else dtmRelEstatDetalhada.assunto.Caption := 'Assunto: TODOS';

     if cmbpatro.text <> '' then
     begin
       sSql := sSql + ' AND AT.IDPESSJUR = '+cmbpatro.lookupvalue+#13#10;
       dtmRelEstatDetalhada.Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
     end else dtmRelEstatDetalhada.Patrocinadora.Caption := 'Patrocinadora: TODAS';

     if CmbLocal.text <> '' then
     begin
       sSql := sSql + ' AND LA.IDLOCALATEND = '+CmbLocal.lookupvalue+#13#10;
       dtmRelEstatDetalhada.Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
     end else dtmRelEstatDetalhada.Local.Caption := 'Local de Atendimento: TODOS';

     if CmbGrupoAssunto.text <> '' then
     begin
       sSql := sSql + ' AND ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+#13#10;
       dtmRelEstatDetalhada.Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
     end else dtmRelEstatDetalhada.Grupo.Caption := 'Grupo de Assunto: TODOS';

     if dblkCidade.text <> '' then
     begin
       ssql := ssql + ' AND EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                      ' AND EP.IDCIDADES = CID.IDCIDADES(+) AND '+
                      ' EP.IDPESSOA(+) = AT.IDTITULAR ';
       sAux := ' ,ENDPESS EP, CIDADES CID ' + #13#10;
       dtmRelEstatDetalhada.cidade.Caption := 'Cidade: '+ dblkCidade.Text;
     end else dtmRelEstatDetalhada.cidade.Caption := 'Cidade: TODAS';


     dtmRelEstatDetalhada.qryRelaEstat.Close;
     case RgOpcoes.itemindex of
          0:   //por assunto
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Assunto';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Assunto';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       //DAVID - Pendência 18425
                       ' select z.TOPICO, ' +
                       '        z.PERCENT, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  ' +#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, ASS.NOME AS TOPICO, ''                  '' AS PERCENT, ' +#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM                                                 ' +#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA '+ sAux+
                       '   WHERE                                                '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR                         '+#13#10+ SSQL +
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU      '+#13#10+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND                '+#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO                  '+#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                       '+#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR                  '+#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) ' +#13#10+
                       '     AND  PP.IDPESSJUR(+) = AT.IDPESSJUR                '+#13#10+
                       '     AND PP.IDSITPART = SP.IDSITPART(+)                 '+#13#10+
                       '   GROUP BY ASS.NOME '+#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*),  ' +
                       '        decode( ass.NOME, '''', ''Páginas web não relacionadas'', ass.NOME ), ' +
                       '        ''                  '', ' +
                       '        0, 0, 0, 0  ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR,  ' +
                       '                 w.DATAHORA as DATA,  ' +
                       '                 e.IDPESSJUR,  ' +
                       '                 w.IDPAGINA,  ' +
                       '                 p.DESCPAGINA,  ' +
                       '                 -1 as CODATENDENTE,  ' +
                       '                 ''Concluído'' as STATUS,  ' +
                       '                 -1 as IDTIPOATEND  ' +
                       '          from   WEBPAGACESSADAS w,  ' +
                       '                 WEBPAGINA p,  ' +
                       '                 ELEGPATRO e  ' +
                       '          where  e.IDPESSOA = w.IDPESSOA  ' +
                       '            and  w.IDPAGINA = p.IDPAGINA  ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO )  ' +
                       '                                    from   ELEGPATRO x  ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at,  ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la,  ' +
                       '        PARTPREVPLAN pp,  ' +
                       '        SITPART sp,  ' +
                       '        ELEGPATRO el,  ' +
                       '        ASSUNTO ASS  ' +
                       sAux +
                       ' where  ' +
                       '        el.IDPESSOA    = at.IDTITULAR  ' + SSQL +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR  ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA  ' +
                       '                                                          from   PARTPREVPLAN ppp1  ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA  ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) )  ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 )  ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+)  ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+)  ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+)  ' +
                       ' group by ass.NOME  ' +
                       ' ) z ' +
                       ' group by z.TOPICO, ' +
                       '          z.PERCENT ' +
                       ' ORDER BY CONTATEND DESC ';

          end;
          1:  //por atendente
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Atendente';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Atendente';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       ' SELECT  '+#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, US.NOMEUSUARIO AS TOPICO, ''                        '' as PERCENT, '+#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM                                              '+#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, USUARIOSISTEMA US, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE                                             '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR   '+ SsQL +
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU   '+#13#10+
                       '     AND US.IDUSUARIO = AT.CODATENDENTE              '+#13#10+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND             '+#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO               '+#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                    '+#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR               '+#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '     AND PP.IDPESSJUR(+) = AT.IDPESSJUR              '+#13#10+
                       '     AND PP.IDSITPART = SP.IDSITPART(+)              '+#13#10+
                       '   GROUP BY  US.NOMEUSUARIO '+#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ''Auto-Atendimento'', ' +
                       '        ''                        '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        ASSUNTO ASS ' +
                       sAux + 
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       '   ORDER BY 1 desc  '+#13#10;

          end;
          2:  //por status
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Status';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Status';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       //DAVID - Pendência 18425
                       ' select z.TOPICO, ' +
                       '        z.PERCENT, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT '+#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, AT.STATUS AS TOPICO,  ''                        '' AS PERCENT, '+#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       ' FROM                                                  '+#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA ' + sAux+
                       ' WHERE                                                 '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR                     '+sSql+
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU  '+#13#10+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND            '+#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO              '+#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                   '+#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR              '+#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '     AND   PP.IDPESSJUR(+) = AT.IDPESSJUR           '+#13#10+
                       '     AND  PP.IDSITPART = SP.IDSITPART(+)            '+#13#10+
                       ' GROUP BY  AT.STATUS '+#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        at.STATUS, ' +
                       '        ''                        '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        ASSUNTO ASS ' +
                       sAux +
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       ' GROUP BY  at.STATUS ' +
                       ' ) z ' +
                       ' group by z.TOPICO, ' +
                       '          z.PERCENT ' +
                       ' ORDER BY CONTATEND desc ';
          end;
          3:  //por Forma Atend
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Forma de Atendimento';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Forma de Atendimento';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       ' SELECT ' +#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, TP.NOME AS TOPICO,  ''                       '' AS PERCENT,  '+#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM                                            '+#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE                                           '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR  '+ sSql+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND           '+#13#10+
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU '+#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO             '+#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                  '+#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR             '+#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL)))  OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '     AND PP.IDPESSJUR(+) = AT.IDPESSJUR            '+#13#10+
                       '     AND PP.IDSITPART = SP.IDSITPART(+)            '+#13#10+
                       '   GROUP BY  TP.NOME '+#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ''Auto-Atendimento'', ' +
                       '        ''                       '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        ASSUNTO ASS ' +
                       sAux +
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       '   ORDER BY 1 desc ';

          end;
          4:  //por patrocinadora
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Patrocinadora';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Patrocinadora';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       //DAVID - Pendência 18425
                       ' select z.TOPICO, ' +
                       '        z.PERCENT, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT '+#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, PES.NOME AS TOPICO, ''                '' AS PERCENT, ' +#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM                                            '+#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, PESSOA PES, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE                                           '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR                    '+#13#10+ sSql +
                       '     AND PES.IDPESSOA = AT.IDPESSJUR               '+#13#10+
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU '+#13#10+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND           '+#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                  '+#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO             '+#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR             '+#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '     AND PP.IDPESSJUR(+) = AT.IDPESSJUR            '+#13#10+
                       '     AND PP.IDSITPART = SP.IDSITPART(+)            '+#13#10+
                       '   GROUP BY PES.NOME '+#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        pes.NOME, ' +
                       '        ''                '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        PESSOA pes, ' +
                       '        ASSUNTO ass ' +
                       sAux +
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  pes.IDPESSOA   = at.IDPESSJUR ' +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       ' group by pes.NOME ' +
                       ' ) z ' +
                       ' group by z.TOPICO, ' +
                       '          z.PERCENT ' +
                       '   ORDER BY CONTATEND desc ';
          end;
          5:  //por local de atendimento
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Local de Atendimento';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Atendimento';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       ' SELECT ' +#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, LAT.DESCLOCALATEND AS TOPICO,  ''             '' as PERCENT, '+#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM                                            ' +#13#10+
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, PESSOA PES, LOCALATENDXCPU LA, LOCALATEND LAT ' + sAux+
                       '   WHERE                                           '+#13#10+
                       '     EL.IDPESSOA = AT.IDTITULAR '+ sSql +
                       '     AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU ' +#13#10+
                       '     AND LA.IDLOCALATEND = LAT.IDLOCALATEND        ' +#13#10+
                       '     AND PES.IDPESSOA = AT.IDPESSJUR               ' +#13#10+
                       '     AND AT.IDTIPOATEND = TP.IDTIPOATEND           ' +#13#10+
                       '     AND AST.IDATEND = AT.IDATEND                  ' +#13#10+
                       '     AND ASS.IDASSUNTO = AST.IDASSUNTO             ' +#13#10+
                       '     AND PP.IDPESSOA(+) = AT.IDTITULAR             ' +#13#10+
                       '     AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '     AND PP.IDPESSJUR(+) = AT.IDPESSJUR            ' +#13#10+
                       '     AND PP.IDSITPART = SP.IDSITPART(+)            ' +#13#10+
                       '   GROUP BY LAT.DESCLOCALATEND ' + #13#10 +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ''Auto-Atendimento'', ' +
                       '        ''             '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        PESSOA pes, ' +
                       '        ASSUNTO ass ' +
                       sAux +
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  pes.IDPESSOA   = at.IDPESSJUR ' +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       ' group by pes.NOME ' +
                       '   ORDER BY 1 desc ';
          end;
          6: //por grupo de assunto
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Grupo de Assunto';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Grupo de Assunto';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       //DAVID - Pendência 18425
                       ' select z.TOPICO, ' +
                       '        z.PERCENT, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT ' +#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, GA.DESCGRUPOASSUNTO AS TOPICO, ''                      '' as PERCENT, '+#13#10+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       ' FROM                                             ' +#13#10+
                       '    ATEND AT , TIPOATEND TP , ASSUNTO ASS, GRUPOASSUNTO  GA, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA  ' + sAux+
                       ' WHERE                                            ' +#13#10+
                       '    EL.IDPESSOA = AT.IDTITULAR                    ' +#13#10+ sSql+
                       '    AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU ' +#13#10+
                       '    AND AT.IDTIPOATEND = TP.IDTIPOATEND           ' +#13#10+
                       '    AND ASS.IDASSUNTO = AST.IDASSUNTO             ' +#13#10+
                       '    AND AST.IDATEND = AT.IDATEND                  ' +#13#10+
                       '    AND  PP.IDPESSOA(+) = AT.IDTITULAR            ' +#13#10+
                       '    AND ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) OR PP.FLGDESATIVADO IN (0, NULL)) '+#13#10+
                       '    AND  PP.IDPESSJUR(+) = AT.IDPESSJUR           ' +#13#10+
                       '    AND  PP.IDSITPART = SP.IDSITPART(+)           ' +#13#10+
                       '    AND  GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO   ' +#13#10+
                       ' GROUP BY GA.DESCGRUPOASSUNTO ' +#13#10+
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ga.DESCGRUPOASSUNTO, ' +
                       '        ''                      '', ' +
                       '        0, 0, 0, 0 ' +
                       ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                       '                 w.DATAHORA as DATA, ' +
                       '                 e.IDPESSJUR, ' +
                       '                 w.IDPAGINA, ' +
                       '                 p.DESCPAGINA, ' +
                       '                 -1 as CODATENDENTE, ' +
                       '                 ''Concluído'' as STATUS, ' +
                       '                 -1 as IDTIPOATEND ' +
                       '          from   WEBPAGACESSADAS w, ' +
                       '                 WEBPAGINA p, ' +
                       '                 ELEGPATRO e ' +
                       '          where  e.IDPESSOA = w.IDPESSOA ' +
                       '            and  w.IDPAGINA = p.IDPAGINA ' +
                       '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                       '                                    from   ELEGPATRO x ' +
                       '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                       '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                       '        PARTPREVPLAN pp, ' +
                       '        SITPART sp, ' +
                       '        ELEGPATRO el, ' +
                       '        GRUPOASSUNTO ga, ' +
                       '        ASSUNTO ass ' +
                       sAux +
                       ' where ' +
                       '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                       '   and  ga.IDGRUPOASSUNTO = ass.IDGRUPOASSUNTO ' +
                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                       ' group by ga.DESCGRUPOASSUNTO  ' +
                       ' ) z ' +
                       ' group by z.TOPICO, ' +
                       '          z.PERCENT ' +
                       '   ORDER BY CONTATEND desc ';
          end;
          7: //por cidades
          begin
            dtmRelEstatDetalhada.ppLabel1.Caption := 'Relatório Estatístico por Cidades';
            dtmRelEstatDetalhada.ppLabelTopico.Caption := 'Cidade';
            dtmRelEstatDetalhada.qryRelaEstat.sql.text :=
                       //DAVID - Pendência 18425
                                     ' select z.TOPICO, ' +
                                     '        z.PERCENT, ' +
                                     '        sum( z.CONTATEND         ) as CONTATEND, ' +
                                     '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                                     '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                                     '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                                     '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                                     ' from ( ' +
                                     ' SELECT '+#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                                     '   DISTINCT COUNT (AT.IDATEND) AS CONTATEND,  '+#13#10+
                                     '    NVL(CID.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS TOPICO, ' +
                                     '    ''                    ''    AS PERCENT,    '+#13#10+
                                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                                     ' FROM                                         '+#13#10+
                                     '   ATEND AT ,                                 '+#13#10+
                                     '   TIPOATEND TP ,                             '+#13#10+
                                     '   ASSUNTO ASS,                               '+#13#10+
                                     '   GRUPOASSUNTO  GA,                          '+#13#10+
                                     '   ASSUNTOXATEND AST,                         '+#13#10+
                                     '   PARTPREVPLAN PP,                           '+#13#10+
                                     '   SITPART SP,                                '+#13#10+
                                     '   ELEGPATRO EL,                              '+#13#10+
                                     '   LOCALATENDXCPU LA,                         '+#13#10+
                                     '   ENDPESS EP,                                '+#13#10+
                                     '   CIDADES CID                                '+#13#10+
                                     ' WHERE                                        '+#13#10+
                                     '            EP.IDCIDADES = CID.IDCIDADES(+)            '+#13#10+ Ssql+
                                     '   AND      EP.IDPESSOA(+) = AT.IDTITULAR              '+#13#10+
                                     '   AND      EL.IDPESSOA = AT.IDTITULAR                 '+#13#10+
                                     '   AND      AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU  '+#13#10+
                                     '   AND      AT.IDTIPOATEND = TP.IDTIPOATEND            '+#13#10+
                                     '   AND      ASS.IDASSUNTO = AST.IDASSUNTO              '+#13#10+
                                     '   AND      AST.IDATEND = AT.IDATEND                   '+#13#10+
                                     '   AND      PP.IDPESSOA(+) = AT.IDTITULAR              '+#13#10+
                                     '   AND    ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND PPP1.FLGDESATIVADO IN (0,NULL))) OR PP.FLGDESATIVADO IN (0,NULL)) '+#13#10+
                                     '   AND      PP.IDPESSJUR(+) = AT.IDPESSJUR             '+#13#10+
                                     '   AND      PP.IDSITPART = SP.IDSITPART(+)             '+#13#10+
                                     '   AND      GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO     '+#13#10+
                                     '   GROUP BY NVL(CID.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') '+#13#10+
                                     //DAVID - Pendência 18425
                                     ' union ' +
                                     ' select COUNT(*), ' +
                                     '        nvl( cid.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS CIDADES, ' +
                                     '        ''                    '', ' +
                                     '        0, 0, 0, 0 ' +
                                     ' from   ( select w.IDPESSOA as IDTITULAR, ' +
                                     '                 w.DATAHORA as DATA, ' +
                                     '                 e.IDPESSJUR, ' +
                                     '                 w.IDPAGINA, ' +
                                     '                 p.DESCPAGINA, ' +
                                     '                 -1 as CODATENDENTE, ' +
                                     '                 ''Concluído'' as STATUS, ' +
                                     '                 -1 as IDTIPOATEND ' +
                                     '          from   WEBPAGACESSADAS w, ' +
                                     '                 WEBPAGINA p, ' +
                                     '                 ELEGPATRO e ' +
                                     '          where  e.IDPESSOA = w.IDPESSOA ' +
                                     '            and  w.IDPAGINA = p.IDPAGINA ' +
                                     '            and  e.DATAADMISSAO = ( select max( x.DATAADMISSAO ) ' +
                                     '                                    from   ELEGPATRO x ' +
                                     '                                    where  x.IDPESSOA = w.IDPESSOA ) ) at, ' +
                                     '        ( select -1 as IDLOCALATEND from DUAL ) la, ' +
                                     '        PARTPREVPLAN pp, ' +
                                     '        SITPART sp, ' +
                                     '        ELEGPATRO el, ' +
                                     '        ASSUNTO ass, ' +
                                     '        ENDPESS ep, ' +
                                     '        CIDADES cid ' +
                                     ' where ' +
                                     '        el.IDPESSOA    = at.IDTITULAR ' + SSQL +
                                     '   and  at.IDTITULAR = ep.IDPESSOA(+) ' +
                                     '   and  ep.IDCIDADES = cid.IDCIDADES(+) ' +
                                     '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                                     '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                                     '                                                          from   PARTPREVPLAN ppp1 ' +
                                     '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                                     '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                                     '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                                     '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                                     '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                                     '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' +
                                     ' group by nvl( cid.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') ' +
                                     ' ) z ' +
                                     ' group by z.TOPICO, ' +
                                     '          z.PERCENT ' +
                                     '   ORDER BY CONTATEND desc ';
          end;
     end; //case
     dtmRelEstatDetalhada.qryAux := dtmRelEstatDetalhada.qryRelaEstat;
     dtmRelEstatDetalhada.qryAux.Open;

     //DAVID - Pendência 18425
     //Previne linhas em branco
     with dtmRelEstatDetalhada do
     begin
       while not qryAux.Eof do
       begin
         if qryAux.FieldByName('CONTATEND').AsInteger = 0 then
         begin
           qryAux.Delete;
           qryAux.First;
           Continue;
         end;
         qryAux.Next;
       end;
     end;

     Totaliza;

     if rgrpExibir.ItemIndex = 0 then
     begin
       dtmRelEstatDetalhada.sTotalTempoMedio := FormatFloat( '#,###', iTotalTempoMedio ) + ' s';
       dtmRelEstatDetalhada.sTotalTempoTotal := FormatFloat( '#,###', iTotalTempoTotal ) + ' s';
     end
     else
     begin
       dtmRelEstatDetalhada.sTotalTempoMedio := SegundosParaHMS( iTotalTempoMedio );
       dtmRelEstatDetalhada.sTotalTempoTotal := SegundosParaHMS( iTotalTempoTotal );
     end;

     // calcula o percentual de cada linha
     dtmRelEstatDetalhada.qryAux.First;
     while not dtmRelEstatDetalhada.qryAux.eof do
     begin
       dtmRelEstatDetalhada.qryAux.Edit;
       percent := (dtmRelEstatDetalhada.qryAux.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
       dtmRelEstatDetalhada.qryAux.fieldByName('PERCENT').asString := FormatFloat('#,##0.00', percent)+ '%';
       dtmRelEstatDetalhada.qryAux.Post;
       dtmRelEstatDetalhada.qryAux.Next;
     end;
     dtmRelEstatDetalhada.qryRelaEstat := dtmRelEstatDetalhada.qryAux;
end;

procedure TfrmPRelEstatDetalhada.Totaliza;
begin

  TotalGeral := 0;
  iTotalTempoMedio := 0;
  iTotalTempoTotal := 0;

  if dtmRelEstatDetalhada.qryAux.Active then
    dtmRelEstatDetalhada.qryAux.First;

  while not dtmRelEstatDetalhada.qryAux.Eof do
  begin
    TotalGeral := TotalGeral + dtmRelEstatDetalhada.qryAux.fieldByName('CONTATEND').asInteger;
    iTotalTempoTotal := iTotalTempoTotal + dtmRelEstatDetalhada.qryAux.fieldByName('TOTAL_EM_SEGUNDOS').asInteger;
    dtmRelEstatDetalhada.qryAux.Next;
  end;

  if TotalGeral > 0 then
    iTotalTempoMedio := round( iTotalTempoTotal / TotalGeral );

end;

procedure TfrmPRelEstatDetalhada.FormCreate(Sender: TObject);
begin
  inherited;
  TotalGeral := 0;
  percent := 0;
  qryCidades.Open;
  qrypatro.Open;
  qryfilial.Open;
  qryatend.Open;
  qryassunto.Open;
  QryGrupoAssunto.Open;
  qryformaatend.Open;
  qryLocalAtend.Open;
  QryPlanPrev.Open;
  QrySituCad.Open;
  qryCidades.Open;
end;

end.

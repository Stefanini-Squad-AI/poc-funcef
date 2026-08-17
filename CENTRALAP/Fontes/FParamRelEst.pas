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

unit FParamRelEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CMDBLookupCombo, wwdblook, ExtCtrls, Db, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, uModulo,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, PPClass, usistema;

type
  TFrmParamRelEst = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dataini: TCMDateTimePicker;
    datafin: TCMDateTimePicker;
    Label12: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label29: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    QryAssunto: TwwQuery;
    QryAssuntoNOME: TStringField;
    QryAssuntoIDASSUNTO: TFloatField;
    qryAtendente: TwwQuery;
    qryAtendenteNOMEUSUARIO: TStringField;
    qryAtendenteIDUSUARIO: TFloatField;
    QrySituCad: TwwQuery;
    QrySituCadDESCRICAO: TStringField;
    QrySituCadIDSITPART: TFloatField;
    qryLocalAtend: TwwQuery;
    qryLocalAtendIDLOCALATEND: TFloatField;
    qryLocalAtendDESCLOCALATEND: TStringField;
    qryPlano: TwwQuery;
    qryPlanoNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    qryPatro: TwwQuery;
    qryPatroIDPESSOA: TFloatField;
    qryPatroNOME: TStringField;
    QryGrupoAssunto: TwwQuery;
    QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField;
    QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField;
    qryFormaAtendimento: TwwQuery;
    RgOrdena: TRadioGroup;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    edinsc: TEdit;
    CmbGrupoAssunto: TwwDBLookupCombo;
    Label14: TLabel;
    CmSituacaoPart: TCMDBLookupCombo;
    cmbatend: TwwDBLookupCombo;
    cmbassunto: TwwDBLookupCombo;
    cmbPlano: TwwDBLookupCombo;
    CmbLocal: TCMDBLookupCombo;
    cmbstatus: TComboBox;
    cmbforma: TwwDBLookupCombo;
    cmbpatro: TwwDBLookupCombo;
    dblkCidade: TwwDBLookupCombo;
    Label26: TLabel;
    qryCidades: TwwQuery;
    qryCidadesNOME: TStringField;
    qryCidadesIDCIDADES: TFloatField;
    qryCidadesCODESTADO: TStringField;
    qryCidadesIDESTADO: TFloatField;
    qryCidadesIDPAIS: TFloatField;
    qryCidadesUF: TStringField;
    rgrpExibir: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FzQry;
    procedure cmbPlanoChange(Sender: TObject);
  private
    { Private declarations }
    ssql: string;
  public
    
  end;

var
  FrmParamRelEst: TFrmParamRelEst;

implementation
uses dRelCentralAP;
{$R *.DFM}

procedure TFrmParamRelEst.FormCreate(Sender: TObject);
begin
  inherited;
  ssql := '';
  qryFormaAtendimento.Open;
  QryGrupoAssunto.Open;
  qryAtendente.Open;
  QryAssunto.Open;
  qryPatro.Open;
  qryPlano.Open;
  qryLocalAtend.Open;
  QrySituCad.Open;
  qryCidades.Open;
end;

procedure TFrmParamRelEst.bbtnConfirmarClick(Sender: TObject);
var
  contador : LongInt;
  iTempoTotal : integer; 
begin
  inherited;

  if not Sistema.GravaLogOperacoes('Oper. de Cons. do Relat. Estat. de Atendimentos') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;

  if rgrpExibir.ItemIndex = 0 then
  begin
    dtmRelCentralAP.ppDBTempoAtendimento.DataField := 'TEMPOATENDIMENTO';
    dtmRelCentralAP.pplblTempo.Caption := 'Tempo (s)';
  end
  else
  begin
    dtmRelCentralAP.ppDBTempoAtendimento.DataField := 'TempoFormatado';
    dtmRelCentralAP.pplblTempo.Caption := 'Tempo';
  end;

  FzQry;
  dtmRelCentralAP.qryRelEst.Close;
  dtmRelCentralAP.qryRelEst.Open;

  dtmRelCentralAP.qryRelEst.First;
  contador := 0;
  iTempoTotal := 0;
  while not dtmRelCentralAP.qryRelEst.Eof do
  begin
    iTempoTotal := iTempoTotal + dtmRelCentralAP.qryRelEstTEMPOATENDIMENTO.AsInteger;
    contador := contador + 1;
    dtmRelCentralAP.qryRelEst.Next;
  end;
  
  dtmRelCentralAP.qryRelEst.First;
  dtmRelCentralAP.LbContador.Caption := intToStr( Contador );

  if rgrpExibir.ItemIndex = 0 then
    dtmRelCentralAP.ppTempoTotal.Caption := intToStr( iTempoTotal ) + 's'
  else
    dtmRelCentralAP.ppTempoTotal.Caption := SegundosParaHMS( iTempoTotal );
end;

procedure TFrmParamRelEst.FzQry;
var
  Grupo: TppGroup;
  sAux, sfiltro : string;
begin
  sAux := '';
  sFiltro := '';
  // por cidades
  if dblkCidade.text <> '' then
  begin
    sfiltro := sfiltro + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +  'AND'+#13#10;
    dtmRelCentralAp.LbCidade.Caption := 'Cidade: '+ dblkCidade.Text;
  end;

  ssql:=
'SELECT DISTINCT '+#13#10+ // Daniel - 28168 ( Retirada /*+RULE*/ )
        ' AT.IDTITULAR, '+#13#10+
        ' AT.IDATEND, '+#13#10+
        ' AT.CODATEND,'+#13#10+
        ' AT.NOMESOLICITANTE, '+#13#10+
        ' TELSOLICITANTE, '+#13#10+
        ' AT.CODATENDENTE, '+#13#10+
        ' AT.DATA, '+#13#10+
        ' AT.STATUS, '+#13#10+
        ' AT.PERGUNTA, '+#13#10+
        ' AT.RESPOSTA, '+#13#10+
        ' AT.OBSERVACAO, '+#13#10+
        ' TP.NOME AS TIPO, '+#13#10+
        ' EL.MATRICULA, '+#13#10+
        ' P.NUMDOCUMENTO CPF, '+#13#10+
        ' P.NOME AS TITULAR, '+#13#10+
        ' PREV.INSCRICAONUMERO, '+#13#10+
        ' PJ.NOME AS PATRO, '+#13#10+
        ' PL.NOME AS PLANO, '+#13#10+
        ' US.NOMEUSUARIO, '+#13#10+
        ' AT.DATAINICIO, '+#13#10+
        ' LAT.DESCLOCALATEND, ' +#13#10+
        ' ASS.NOME AS NOMEASSUNTO, ' +#13#10+
        ' SP.DESCRICAO AS SITUACAOPART, ' +#13#10+
        ' GA.DESCGRUPOASSUNTO , ' +#13#10+
        ' ((AT.DATA - AT.DATAINICIO)*86400) AS TEMPOATENDIMENTO, ' +#13#10+
        ' AXA.IDPROCESSO, '+#13#10+
        ' AXA.IDRUBS AS IDRUB, '+#13#10+
        ' DECODE(AXA.IDPROCESSO,NULL,0.00,1.00) AS EXISTERAD, '+#13#10+
        ' DECODE(AXA.IDRUBS,NULL,0.00,1.00) AS EXISTERUB, '+#13#10+
        ' R.DESCRESPATEN, '+#13#10+
        ' ASS.NOME, '+#13#10+
        ' CID.NOME AS CIDADE '+#13#10+
     ' FROM  ENDPESS EP, CIDADES CID, '+#13#10+
        ' PESSOA P, '+#13#10+
        ' PESSOA PJ, '+#13#10+
        ' PARTPREVPLAN PREV, '+#13#10+
        ' ELEGPATRO EL, '+#13#10+
        ' ATEND AT, '+#13#10+
        ' TIPOATEND TP, '+#13#10+
        ' PLANPREV PL, '+#13#10+
        ' USUARIOSISTEMA US, '+#13#10+
        ' LOCALATENDXCPU LA, ' +#13#10+
        ' ASSUNTOXATEND AXA, ' +#13#10+
        ' LOCALATEND LAT, ' +#13#10+
        ' ASSUNTO ASS, ' +#13#10+
        ' SITPART SP, ' +#13#10+
        ' GRUPOASSUNTO GA, ' +#13#10+
        ' ASSUNTOXRESP AR, '+#13#10+
        ' RESPATEND R '+#13#10+
     ' WHERE '+sfiltro+#13#10;

  // filtro patrocinadora
  if cmbpatro.text <> '' then
      ssql := ssql + ' EL.IDPESSJUR = '+cmbpatro.LookUpValue+' AND';

  // filtro plano
  if cmbPlano.text <> '' then
      ssql := ssql + ' PREV.IDPLANOPREV = '+cmbPlano.LookUpvalue+' AND';

  // filtro forma de atendimento
  if cmbforma.text <> '' then
      ssql := ssql + ' AT.IDTIPOATEND = '+cmbforma.LookUpValue+' AND';

  // filtro Status
  if cmbstatus.text <> '' then
      ssql := ssql + ' AT.STATUS = '+QuotedStr(cmbstatus.Text)+' AND';

  // filtro Atendente
  if cmbatend.text <> '' then
      ssql := ssql + ' AT.CODATENDENTE = '+cmbatend.LookupValue+' AND';

  // filtro data inicial
  if dataini.text <> '' then
  begin
    ssql := ssql + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND';
    dtmRelCentralAp.lblDataInicio.Caption:=dataIni.Text;
  end
  else
    dtmRelCentralAp.lblDataInicio.Caption:='';

  // filtro data final
  if datafin.text <> '' then
  begin
    ssql := ssql + ' AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND';
    dtmRelCentralAp.lblDataFim.Caption:=dataFin.Text;
  end
  else
    dtmRelCentralAp.lblDataFim.Caption:='';

  // filtro matrícula
  if edmatricula.text <> '' then
     sSQL := sSql + ' EL.MATRICULA like '''+edmatricula.text+'%'+''' AND' ;

  // filtro CPF
  if edcpf.text <> '' then
     sSQL := sSql + ' P.NUMDOCUMENTO = '''+edcpf.text+''' AND' ;

  // filtro Inscrição Previdenciária
  if edinsc.Text <> '' then
     sSQL := sSql + ' PREV.INSCRICAONUMERO = '''+edinsc.text+''' AND' ;

  if CmSituacaoPart.Text <> '' then
     sSQL := sSql + ' PREV.IDSITPART = '+CmSituacaoPart.lookupvalue+' AND' ;

  if CmbLocal.Text <> '' then
     sSQL := sSql + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+' AND' ;

  if cmbassunto.Text <> '' then
     sSQL := sSql + ' AXA.IDASSUNTO = '+cmbassunto.lookupvalue+' AND' ;

  // Filtro Nome
  if ednome.text <> '' then
     sSQL := sSql + ' UPPER(P.NOME) LIKE ''%'+ednome.text +'%'' AND' ;

  //Filtro Por Grupo de assunto
  if CmbGrupoAssunto.text <> '' then
     sSQL := sSQL + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';

        ssql:= ssql+ ' AT.IDTITULAR = P.IDPESSOA '+
//*** tavares 28/08/2002 incluí as duas linhas seguintes para adicionar o campo cidades
        ' AND EP.IDCIDADES = CID.IDCIDADES(+)  '+
        ' AND EP.IDPESSOA(+)   = AT.IDTITULAR  '+
        ' AND AXA.IDATEND         = AT.IDATEND ' +
        ' AND AXA.IDASSUNTO       = ASS.IDASSUNTO ' +
        ' AND AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU ' +
        ' AND LAT.IDLOCALATEND  = LA.IDLOCALATEND '  +
        ' AND EL.IDPESSJUR      = PJ.IDPESSOA '+
        ' AND EL.IDPESSOA       = AT.IDTITULAR '+
        ' AND TP.IDTIPOATEND    = AT.IDTIPOATEND '+
        ' AND AT.IDPESSJUR      = EL.IDPESSJUR '+
        ' AND US.IDUSUARIO      = TO_NUMBER(AT.CODATENDENTE) '+
        ' AND PREV.IDPESSOA(+)  = EL.IDPESSOA '+
        ' AND PREV.IDPESSJUR(+) = EL.IDPESSJUR '+
        ' AND ((PREV.FLGDESATIVADO = 1 AND PREV.IDPESSOA NOT IN '+
        ' (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PREV.IDPESSOA AND PPP1.FLGDESATIVADO IN (0, NULL))) '+
        '  OR PREV.FLGDESATIVADO IN (0, NULL)) '+
        ' AND PREV.IDSITPART    = SP.IDSITPART '+
        ' AND GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO ' +
        ' AND PL.IDPLANOPREV    = PREV.IDPLANOPREV ' +
        ' AND PL.IDPLANOPREV    = PREV.IDPLANOPREV AND '+
        ' (AXA.IDASSUNTOXRESP = AR.IDASSUNTOXRESP(+)) AND '+
        ' (AR.IDRESPATEND = R.IDRESPATEND(+)) ';

  case RgOrdena.itemindex of
      0:begin
          ssql:=ssql + 'ORDER BY US.NOMEUSUARIO';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Atendente: ';
            rpRelEstdbTGrupo.DataField := 'NOMEUSUARIO';
          end;
        end;
      1:begin
          ssql:=ssql + 'ORDER BY AT.STATUS';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Status: ';
            rpRelEstdbTGrupo.DataField := 'STATUS';
          end;
        end;

      2:begin
          ssql:=ssql + 'ORDER BY TIPO';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Forma de Atendimento: ';
            rpRelEstdbTGrupo.DataField := 'TIPO';
          end;
        End;
      3:begin
          ssql:=ssql + 'ORDER BY SITUACAOPART';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Situação na Fundação: ';
            rpRelEstdbTGrupo.DataField := 'SITUACAOPART';
          end;
        End;
      4:begin
          ssql:=ssql + 'ORDER BY LAT.DESCLOCALATEND';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Local de Atendimento: ';
            rpRelEstdbTGrupo.DataField := 'DESCLOCALATEND';
          end;
        End;
      5:begin
          ssql:=ssql + 'ORDER BY PLANO';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Plano Previdenciário: ';
            rpRelEstdbTGrupo.DataField := 'PLANO';
          end;
        end;

      6:begin //Grupo de Assunto
          ssql:=ssql + 'ORDER BY DESCGRUPOASSUNTO';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Grupo do Assunto: ';
            rpRelEstdbTGrupo.DataField := 'DESCGRUPOASSUNTO';
          end;
        end;


///**** tavares 28/08/2002
      7:begin //ordenar por cidade
          ssql:=ssql + 'ORDER BY CID.NOME';
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Cidade: ';
            rpRelEstdbTGrupo.DataField := 'CIDADE';
          end;
        end;

///**** tavares 23/09/2002
      8:begin
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Matrícula: ';
            rpRelEstdbTGrupo.DataField := 'MATRICULA';
          end;
          ssql:=ssql + ' ORDER BY EL.MATRICULA ASC ';
        end;

///**** tavares 23/09/2002
      9:begin
          With dtmRelCentralAP do
          begin
            rpRelEstlblGrupo.Caption   := 'Cód. Atend.: ';
            rpRelEstdbTGrupo.DataField := 'CODATEND';
          end;
          ssql:=ssql + ' ORDER BY AT.CODATEND ASC ';
        end;

      End;


   dtmRelCentralAP.qryRelEst.sql.clear;
   dtmRelCentralAP.qryRelEst.sql.add(ssql);
   dtmRelCentralAP.qryRelEst.Open;

end;


procedure TFrmParamRelEst.cmbPlanoChange(Sender: TObject);
begin
  inherited;
  if cmbPlano.text <> '' then
  begin
    qryassunto.close;
    qryAssunto.Sql.Clear;
    qryAssunto.Sql.Add('SELECT '+ // Daniel - 28168 ( Retirada /*+RULE*/ )
                      ' ASSUNTO.NOME, ' +
                      ' PLANPREV.NOME, ' +
                      ' ASSUNTO.IDASSUNTO, ' +
                      ' ASSUNTO.IDTIPOPROCESSO, ' +
                      ' ASSUNTO.IDCONFIGRUBS, ' +
                      ' ASSUNTO.IDGRUPOASSUNTO '+
                      'FROM  ' +
                      'ASSUNTO, ' +
                      'PLANPREV  ' +
                       ' WHERE ' +
                            '( ASSUNTO.IDPLANOPREV = '+ qryplano.FieldByName('idplanoprev').AsString +') AND '+
                            '( ASSUNTO.IDPLANOPREV = PLANPREV.IDPLANOPREV(+))'+
                            'order by ASSUNTO.NOME');
  end
  else
  begin
    qryassunto.close;
    qryAssunto.Sql.Clear;
    qryAssunto.Sql.text := 'SELECT NOME, IDASSUNTO FROM ASSUNTO ORDER BY NOME';
  end;
  qryAssunto.Open;
end;


end.

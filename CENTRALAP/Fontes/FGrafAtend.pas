{-------------------------------------------------------------------------------
 Analista Responsável: André Tavares
 - Atualizado em 16/08/2002
                 23/12/2003 - André Tavares - pendência 15696 - alterei a query
                              qryAtendete
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 03.02.14
Pendência   : 23272
Data        : 15/01/2007
Responsável : Daniel Simões
Descrição   : Liberação de parâmetro no form que define quantidade máxima de
              partições no gráfico de pizza à escolha do usuário e definido
              valor padrão de 15...
--------------------------------------------------------------------------------
Padrão      :
Pendência   : 18425
Data        : 03/05/2005
Responsável : David Ayrolla
Descrição   : Incluído no gráfico os atendimentos pelo Auto-Atendimento.
--------------------------------------------------------------------------------
Tavares  12/04/2002
- Retirei os itens abaixo do Modo de apresentação, pois agora o gráfico dispõe
  de legenda

* Tópico e Valor do total
* Tópico e Porcent do total
* Tópico
* Tópico e Porcentagem
* Legenda
-------------------------------------------------------------------------------}

unit FGrafAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Series, TeEngine, TeeProcs, Chart, DBChart, ExtCtrls,
  StdCtrls, TEdNum, wwdblook, ComCtrls, MAHlpBtn, Buttons,  Db,
  DBTables, Wwquery, TB97, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, CMDBLookupCombo, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, Wwdbspin, ppChrtDP, ppPrnabl,
  ppClass, ppCtrls, ppChrt, ppDB, ppBands, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppVar, ppEndUsr, ppStrtch, ppMemo,
  fPreview, DBaseDados, UDataBase, usistema, fcLabel, uModulo;

type
  TfrmGrafAtend = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    qrypatro: TwwQuery;
    dspatro: TwwDataSource;
    dsgrafico: TwwDataSource;
    qryatend: TwwQuery;
    dsatend: TwwDataSource;
    qryassunto: TwwQuery;
    dsassunto: TwwDataSource;
    qryformaatend: TwwQuery;
    dsformaatend: TwwDataSource;
    qryfilial: TwwQuery;
    RgOpcoes: TRadioGroup;
    rdgrpmodo: TRadioGroup;
    rdgrgraf: TRadioGroup;
    Label1a: TLabel;
    Label2a: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label29: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cmbPatro: TwwDBLookupCombo;
    cmbAtend: TwwDBLookupCombo;
    cmbAssunto: TwwDBLookupCombo;
    cmbForma: TwwDBLookupCombo;
    cmbStatus: TComboBox;
    cmbFilial: TwwDBLookupCombo;
    DataIni: TCMDateTimePicker;
    DataFin: TCMDateTimePicker;
    QryPlanPrev: TwwQuery;
    QryPlanPrevIDPLANOPREV: TFloatField;
    QryPlanPrevNOME: TStringField;
    Label9: TLabel;
    cmbPlanPrev: TwwDBLookupCombo;
    cmbSitcad: TwwDBLookupCombo;
    Label10: TLabel;
    QrySituCad: TwwQuery;
    QrySituCadIDSITPART: TFloatField;
    QrySituCadDESCRICAO: TStringField;
    qryLocalAtend: TwwQuery;
    qryLocalAtendIDLOCALATEND: TFloatField;
    qryLocalAtendDESCLOCALATEND: TStringField;
    Label11: TLabel;
    cmbLocal: TCMDBLookupCombo;
    qryassuntoIDASSUNTO: TFloatField;
    qryassuntoNOME: TStringField;
    qryatendIDUSUARIO: TFloatField;
    qryatendNOMEUSUARIO: TStringField;
    qryfilialNOME: TStringField;
    qryfilialIDPESSOA: TFloatField;
    qryformaatendIDTIPOATEND: TFloatField;
    qryformaatendNOME: TStringField;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    QryGrupoAssunto: TwwQuery;
    QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField;
    QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField;
    Label12: TLabel;
    cmbGrupoAssunto: TwwDBLookupCombo;
    qryAux: TwwQuery;
    UpdqryAux: TUpdateSQL;
    QRYaux2: TwwQuery;
    qryGrafico: TwwQuery;
    wwSpinEdit: TwwDBSpinEdit;
    Label13: TLabel;
    ppReportGrafico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    wwDataSource1: TwwDataSource;
    ppDBPipeline1: TppDBPipeline;
    qryFun: TwwQuery;
    DSfun: TwwDataSource;
    qryFunNOME: TStringField;
    qryFunRAZAOSOCIAL: TStringField;
    qryFunLOGRADOURO: TStringField;
    qryFunNUMERO: TStringField;
    qryFunCOMPLEMENTO: TStringField;
    qryFunBAIRRO: TStringField;
    qryFunCIDADE: TStringField;
    qryFunCODESTADO: TStringField;
    qryFunCEP: TStringField;
    qryFunIMAGEM: TBlobField;
    ppDBPipeline2: TppDBPipeline;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    dblkCidade: TwwDBLookupCombo;
    Label26: TLabel;
    qryCidades: TwwQuery;
    qryCidadesNOME: TStringField;
    qryCidadesIDCIDADES: TFloatField;
    qryCidadesCODESTADO: TStringField;
    qryCidadesIDESTADO: TFloatField;
    qryCidadesIDPAIS: TFloatField;
    qryCidadesUF: TStringField;
    Patrocinadora: TppLabel;
    Filial: TppLabel;
    Atendente: TppLabel;
    Assunto: TppLabel;
    Grupo: TppLabel;
    Status: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    Forma: TppLabel;
    Local: TppLabel;
    Plano: TppLabel;
    Situacao: TppLabel;
    ppLabel3: TppLabel;
    cidade: TppLabel;
    UpdGrafico: TUpdateSQL;
    Label1: TLabel;
    DBSpinEditQtdCidades: TwwDBSpinEdit;
    ppSystemVariable2: TppSystemVariable;
    ppLblTempoMedioTotal: TppLabel;
    ppLine2: TppLine;
    fcLabel1: TfcLabel;
    rgrpExibir: TRadioGroup;
    ppTeeChart1: TppDPTeeChart;
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZeraValores;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbLocalEnter(Sender: TObject);
    procedure RgOpcoesClick(Sender: TObject);
    procedure AtualizagraficoReport;
    procedure InicializaGrafico;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Totaliza;
  private
    function TempoFormatado( iSegundos : integer ) : string;
  public

    TotalGeral, percent : Double;

    // David - 18425
    // Variável que totaliza apenas os atendimentos cujo tempo médio será considerado
    TotalTempoMedio : double;

  end;

var
  frmGrafAtend: TfrmGrafAtend;
implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmGrafAtend.ZeraValores;
begin

// Daniel -  23612 - Início ----------------------------------------------------
  ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1;
  ppTeeChart1.Chart.Series[0].YValues.ValueSource := '';
  ppTeeChart1.Chart.Series[0].XLabelsSource       := '';

  ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
  ppTeeChart1.Chart.Series[1].XValues.ValueSource := '';
  ppTeeChart1.Chart.Series[1].YValues.ValueSource := '';
  ppTeeChart1.Chart.Series[1].XLabelsSource       := '';
// Daniel -  23612 - Fim -------------------------------------------------------

end;


procedure TfrmGrafAtend.bbtnSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmGrafAtend.FormCreate(Sender: TObject);
begin
 inherited;

 TotalGeral                   := 0;
 TotalTempoMedio              := 0;
 Percent                      := 0;
 RgOpcoes.ItemIndex           := 0;
 wwSpinEdit.Enabled           := RgOpcoes.ItemIndex = 0;
 DBSpinEditQtdCidades.enabled := RgOpcoes.ItemIndex = 7;
 qryCidades.Open;
end;


procedure TfrmGrafAtend.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if not Sistema.GravaLogOperacoes('Operação Consulta de Gráfico de Atendimentos') then
   begin
     Raise Exception.Create('Não foi possível Gravar o Log');
     exit;
   end;

   bbtnSair.Enabled := False;
   InicializaGrafico;
   TFrmPreview.CreateModalPreview(Application, ppreportGrafico, 'Estatísticas de Atendimento');
   dsGrafico.Dataset := qryGrafico;
   qrygrafico := qryAux2;
   bbtnSair.Enabled := True;
end;

procedure TfrmGrafAtend.cmbLocalEnter(Sender: TObject);
begin
  inherited;
  If (Sender IS TCmDbLookupCombo) And
     ((Sender AS TCmDbLookupCombo).LookupTable <> NIL) And
      Not (Sender AS TCmDbLookupCombo).LookupTable.Active Then
          (Sender AS TCmDbLookupCombo).LookupTable.Open;

  If (Sender IS TWwDbLookupCombo) And
     ((Sender AS TWwDbLookupCombo).LookupTable <> NIL) And
      Not (Sender AS TWwDbLookupCombo).LookupTable.Active Then
          (Sender AS TWwDbLookupCombo).LookupTable.Open;
end;

procedure TfrmGrafAtend.RgOpcoesClick(Sender: TObject);
begin
  inherited;

  wwSpinEdit.Enabled           := RgOpcoes.ItemIndex in [0,6];
  DBSpinEditQtdCidades.Enabled := RgOpcoes.ItemIndex = 7;
end;


procedure TfrmGrafAtend.InicializaGrafico;
begin
   qryAux.Close;

// Daniel - 23612 - Início -----------------------------------------------------
   ppTeeChart1.Chart.Title.Text.Clear;
   ppTeeChart1.Chart.Title.Text.Add('Gráfico Estatístico de Atendimento');

   case rdgrGraf.ItemIndex of
     0:begin
         ppTeeChart1.Chart.Series[0].ShowInLegend := True;
         ppTeeChart1.Chart.Series[0].Active       := True;
         ppTeeChart1.Chart.Series[1].Active       := False;
         ppTeeChart1.Chart.Series[1].ShowInLegend := False;
       end;

     1:begin
         ppTeeChart1.Chart.Series[0].ShowInLegend := False;
         ppTeeChart1.Chart.Series[0].Active       := False;
         ppTeeChart1.Chart.Series[1].Active       := True;
         ppTeeChart1.Chart.Series[1].ShowInLegend := True;
       end;
   end;

   if (DataIni.Text<>'') then
     ppTeeChart1.Chart.Title.Text.Add('Data Inicial: '+ dataIni.Text);

   if (DataFin.Text<>'') then
     ppTeeChart1.Chart.Title.Text.Add('Data Final: '+ dataFin.Text);

   case rdgrPmodo.ItemIndex of
     0:begin
         ppTeeChart1.Chart.Series[0].Marks.Style := smsPercent;
         ppTeeChart1.Chart.Series[1].Marks.Style := smsPercent;
       end;

     1:begin
         ppTeeChart1.Chart.Series[0].Marks.Style := smsPercentTotal;
         ppTeeChart1.Chart.Series[1].Marks.Style := smsPercentTotal;
       end;

     2:begin
         ppTeeChart1.Chart.Series[0].Marks.Style := smsValue;
         ppTeeChart1.Chart.Series[1].Marks.Style := smsValue;
       end;

     3:begin
         ppTeeChart1.Chart.Series[0].Marks.Style := smsXValue;
         ppTeeChart1.Chart.Series[1].Marks.Style := smsXValue;
       end;
   end;
// Daniel - 23612 - Fim --------------------------------------------------------

   AtualizaGraficoReport;
end;



procedure TfrmGrafAtend.AtualizagraficoReport;
var sSql1,sAux             : String;
    sTempoMedio            : String;
    Contador,ContaRegistro : Integer;
    TempoTotal, TotAtend   : Double;
begin
  TotAtend          := 0;
  TempoTotal        := 0;
  stempoMedio       := '';
  Saux              := '';
  qryAux2           := qryGrafico;
  dsGrafico.Dataset := qryGrafico;

  case RgOpcoes.itemindex of
    0:begin
        ppLabel1.Caption :=  '      Estatística de Atendimentos por Assunto      ';

        ZeraValores;

        if (DataIni.Text<>'') then
          sSql1 := sSql1+' AT.DATA >= TO_DATE('''+DataIni.Text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

        if (DataFin.Text<>'') then
          sSql1 := sSql1+' AT.DATA <= TO_DATE('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

        if (cmbFilial.Text<>'') then begin
           sSql1          := sSql1+' EL.IDESTAB = '+cmbFilial.LookupValue+'  AND ';
           Filial.Caption := 'Filial: '+cmbFilial.Text;
        end else
          Filial.Caption := 'Filial: TODAS';

        if (cmbAtend.Text<>'') then begin
          sSql1             := sSql1+' AT.CODATENDENTE = '+cmbAtend.Lookupvalue+'  AND ';
          Atendente.Caption := 'Atendente: '+cmbAtend.Text;
        end else
          Atendente.Caption := 'Atendente: TODOS';

        if (cmbStatus.Text<>'') then begin
          sSql1          := sSql1+' AT.STATUS = '''+Trim(cmbStatus.Text)+'''  AND ';
          Status.Caption := 'Status: '+cmbStatus.Text;
        end else
          Status.Caption := 'Status: TODOS';

        if (cmbForma.Text<>'') then
        begin
           sSql1         := sSql1+' AT.IDTIPOATEND = '+cmbForma.LookupValue+'  AND ';
           Forma.Caption := 'Forma de Atendimento: '+cmbForma.Text;
        end else
          Forma.Caption := 'Forma de Atendimento: TODAS';

        if (cmbPlanPrev.Text<>'') then begin
          sSql1         := sSql1+' PP.IDPLANOPREV = '+cmbPlanPrev.LookupValue+'  AND ';
          Plano.Caption := 'Plano: '+cmbPlanPrev.Text;
        end else
          Plano.Caption := 'Plano: TODOS';

        if (cmbSitcad.Text<>'') then begin
          sSql1            := sSql1+' SP.IDSITPART = '+cmbSitcad.LookupValue+'  AND ';
          Situacao.Caption := 'Situação na Fundação: '+cmbSitcad.Text;
        end else
          Situacao.Caption := 'Situação na Fundação: TODAS';

        if (cmbAssunto.Text<>'') then begin
          sSql1           := sSql1+' ASS.IDASSUNTO = '+cmbAssunto.LookupValue+'  AND ';
          Assunto.Caption := 'Assunto: '+cmbAssunto.Text;
        end else
          Assunto.Caption := 'Assunto: TODOS';

        if (cmbPatro.Text<>'') then begin
          sSql1                 := sSql1+' AT.IDPESSJUR = '+cmbPatro.LookupValue+'  AND ';
          Patrocinadora.Caption := 'Patrocinadora: '+cmbPatro.Text;
        end else
          Patrocinadora.Caption := 'Patrocinadora: TODAS';

        if (cmbLocal.Text<>'') then begin
          sSql1         := sSql1+' LA.IDLOCALATEND = '+cmbLocal.LookupValue+'  AND ';
          Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
        end else
          Local.Caption := 'Local de Atendimento: TODOS';

        if (cmbGrupoAssunto.Text<>'') then begin
          sSql1         := sSql1+' ASS.IDGRUPOASSUNTO = '+cmbGrupoAssunto.LookupValue+'  AND ';
          Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
        end else
          Grupo.Caption := 'Grupo de Assunto: TODOS';

        if (dblkCidade.Text<>'') then begin
          sSql1          := sSql1+' EP.IDCIDADES = '+dblkCidade.LookupValue   +
                                  ' AND ep.idcidades = CID.idcidades(+) AND ' +
                                  ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
          sAux           := ' ,Endpess EP, cidades CID ';
          Cidade.Caption := 'Cidade: '+ dblkCidade.Text;
        end else
          Cidade.Caption := 'Cidade: TODAS';

        qryGrafico.Close;
        qryGrafico.SQL.Clear;
        qryGrafico.SQL.Text :=
                  // David - 18425
                  ' SELECT Z.NOME, ' +
                  '        Z.TOPICO, ' +
                  '        SUM( Z.CONTATEND         ) AS CONTATEND, ' +
                  '        SUM( Z.TOTAL_EM_SEGUNDOS ) AS TOTAL_EM_SEGUNDOS, ' +
                  '        SUM( Z.MEDIA_EM_SEGUNDOS ) AS MEDIA_EM_SEGUNDOS, ' +
                  '        SUM( Z.TOTAL_EM_MINUTOS  ) AS TOTAL_EM_MINUTOS, ' +
                  '        SUM( Z.MEDIA_EM_MINUTOS  ) AS MEDIA_EM_MINUTOS ' +
                  ' FROM ( ' +
                  ' SELECT  /*+RULE*/  ' +
                  '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, ASS.NOME,              ' +
                  '     ''                                                                                 '' AS TOPICO, '+
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                  '   FROM ' +
                  '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA' + SAUX+
                  '   WHERE ' + sSql1 +
                  '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                  '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                  '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                  '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                  '     AST.IDATEND = AT.IDATEND AND ' +
                  '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                  ' ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN '+
                  ' (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND NVL(PPP1.FLGDESATIVADO, 0) = 0)) '+
                  ' OR NVL(PP.FLGDESATIVADO, 0) = 0) AND '+
                  '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                  '     PP.IDSITPART = SP.IDSITPART(+) ' +
                  '   GROUP BY ASS.NOME ' +
                  // David - 18425
                  ' UNION ' +
                  ' SELECT COUNT(*),  ' +

                  // David - CBS - 25/08/05
                  '        DECODE( TRIM( ASS.NOME ), '''', ''Páginas web não relacionadas'', TRIM( ASS.NOME ) ),  ' +
                  //----------------------


                  '        ''                                                                                 '', ' +
                  '        0, 0, 0, 0  ' +
                  ' FROM   ( SELECT W.IDPESSOA AS IDTITULAR,  ' +
                  '                 W.DATAHORA AS DATA,  ' +
                  '                 E.IDPESSJUR,  ' +
                  '                 W.IDPAGINA,  ' +
                  '                 P.DESCPAGINA,  ' +
                  '                 -1 AS CODATENDENTE,  ' +
                  '                 ''CONCLUÍDO'' AS STATUS,  ' +
                  '                 -1 AS IDTIPOATEND  ' +
                  '          FROM   WEBPAGACESSADAS W,  ' +
                  '                 WEBPAGINA P,  ' +
                  '                 ELEGPATRO E  ' +
                  '          WHERE  E.IDPESSOA = W.IDPESSOA  ' +
                  '            AND  W.IDPAGINA = P.IDPAGINA  ' +
                  '            AND  E.DATAADMISSAO = ( SELECT MAX( X.DATAADMISSAO )  ' +
                  '                                    FROM   ELEGPATRO X  ' +
                  '                                    WHERE  X.IDPESSOA = W.IDPESSOA ) ) AT,  ' +
                  '        ( SELECT -1 AS IDLOCALATEND FROM DUAL ) LA,  ' +
                  '        PARTPREVPLAN PP,  ' +
                  '        SITPART SP,  ' +
                  '        ELEGPATRO EL,  ' +
                  '        ASSUNTO ASS  ' +
                  sAux +
                  ' WHERE  ' + sSql1 +
                  '        EL.IDPESSOA    = AT.IDTITULAR  ' +

                  // David - CBS - 25/08/05
                  '   AND  EL.IDPESSJUR   = AT.IDPESSJUR  ' +
                  //----------------------

                  '   AND  PP.IDPESSOA(+) = AT.IDTITULAR  ' +
                  '   AND  ( ( PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN ( SELECT PPP1.IDPESSOA  ' +
                  '                                                          FROM   PARTPREVPLAN PPP1  ' +
                  '                                                          WHERE  PPP1.IDPESSOA = PP.IDPESSOA  ' +
                  '                                                            AND  NVL( PPP1.FLGDESATIVADO, 0 ) = 0 ) )  ' +
                  '          OR NVL( PP.FLGDESATIVADO, 0 ) = 0 )  ' +
                  '   AND  AT.IDPESSJUR     = PP.IDPESSJUR (+)  ' +
                  '   AND  PP.IDSITPART     = SP.IDSITPART (+)  ' +
                  '   AND  AT.IDPAGINA      = ASS.IDPAGINA (+)  ' +
                  ' GROUP BY ASS.NOME  ' +
                  ' ) Z ' +
                  ' GROUP BY Z.NOME, ' +
                  '          Z.TOPICO ' +
                  ' ORDER BY 3 DESC ';

        try
          qryGrafico.Open;

          // David - 18425
          //Previne linhas em branco
          while not qryGrafico.Eof do begin
            if (qryGrafico.FieldByName('CONTATEND').AsInteger=0) then begin
              qryGrafico.Delete;
              qryGrafico.First;
              Continue;
            end;

            qryGrafico.Next;
          end;

          Totaliza;
          qryGrafico.First;
          TempoTotal := 0;

          while not qryGrafico.Eof do begin
            Percent := (qryGrafico.FieldByName('CONTATEND').AsFloat*100)/TotalGeral;
            qryGrafico.Edit;

            if (Length(qryGrafico.FieldByName('NOME').AsString)>=35) then begin
              qryGrafico.FieldByName('NOME').AsString := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+
                                                              Copy(qryGrafico.FieldByName('NOME').AsString,1,35);
            end else begin
              qryGrafico.FieldByName('NOME').AsString := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+
                                                              qryGrafico.FieldByName('NOME').AsString+
                                                              StringOfChar(' ',35-Length(qryGrafico.FieldByName('NOME').AsString));
            end;

            sTempoMedio := ' (Tempo Méd = '+StringOfChar(' ',4-Length(FloatToStr(Round(qryGrafico.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat))))
                           +TempoFormatado(Round(qryGrafico.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat))+')';

            qryGrafico.FieldByName('TOPICO').AsString := qryGrafico.FieldByName('NOME').AsString+
                                                         StringOfChar(' ',81-(Length(sTempoMedio)+Length(qryGrafico.FieldByName('NOME').AsString)+Length(FormatFloat('#,##',qryGrafico.FieldByName('CONTATEND').AsFloat))))
                                                         +sTempoMedio;
            TempoTotal := TempoTotal+qryGrafico.FieldByName('TOTAL_EM_SEGUNDOS').AsFloat;
            qryGrafico.Post;
            qryGrafico.Next;
          end;

          qrygrafico.First;

          // Tavares 09/04/2002
          // por assunto                                
          if (qryGrafico.RecordCount>wwSpinEdit.Value) and (RgOpcoes.ItemIndex=0) then begin
            qryAux.Close;
            qryAux.SQL.Clear;

            // DAVID - Pendência 18425
            qryAux.SQL.Text := ' SELECT Z.NOME, '                                                     +#13+
                               '        Z.TOPICO, '                                                   +#13+
                               '        SUM( Z.CONTATEND         ) AS CONTATEND, '                    +#13+
                               '        SUM( Z.TOTAL_EM_SEGUNDOS ) AS TOTAL_EM_SEGUNDOS, '            +#13+
                               '        SUM( Z.MEDIA_EM_SEGUNDOS ) AS MEDIA_EM_SEGUNDOS, '            +#13+
                               '        SUM( Z.TOTAL_EM_MINUTOS  ) AS TOTAL_EM_MINUTOS, '             +#13+
                               '        SUM( Z.MEDIA_EM_MINUTOS  ) AS MEDIA_EM_MINUTOS '              +#13+
                               ' FROM ( '                                                             +#13+
                               '        SELECT   /*+RULE*/  '                                         +#13+
                               '               DISTINCT COUNT (AT.IDATEND) AS CONTATEND, ASS.NOME , ' +#13+
                               '               ''                                                                                 '' AS TOPICO, '                                                              +#13+
                               '               DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO-DATA)*86400),SUM((DATA-DATAINICIO)*86400)) AS TOTAL_EM_SEGUNDOS, '                                         +#13+
                               '               DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO-DATA)*86400)/COUNT(AT.IDATEND),SUM((DATA-DATAINICIO)*86400)/COUNT(AT.IDATEND)) AS MEDIA_EM_SEGUNDOS, '     +#13+
                               '               DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO-DATA)*86400/60),SUM((DATA-DATAINICIO)*86400/60)) AS TOTAL_EM_MINUTOS, '                                    +#13+
                               '               DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO-DATA)*86400/60)/COUNT(AT.IDATEND),SUM((DATA-DATAINICIO)*86400/60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +#13+
                               '        FROM ATEND AT, TIPOATEND TP, ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA '
                               +sAux+
                               '        WHERE '
                               +sSql1+
                               '              EL.IDPESSOA         = AT.IDTITULAR        AND '                                             +#13+
                               '              AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND '                                             +#13+
                               '              AT.IDTIPOATEND      = TP.IDTIPOATEND      AND '                                             +#13+
                               '              ASS.IDASSUNTO       = AST.IDASSUNTO       AND '                                             +#13+
                               '              AST.IDATEND         = AT.IDATEND          AND '                                             +#13+
                               '              PP.IDPESSOA(+)      = AT.IDTITULAR        AND '                                             +#13+
                               '            ((PP.FLGDESATIVADO    = 1 AND PP.IDPESSOA NOT IN ( SELECT PPP1.IDPESSOA '                     +#13+
                               '                                                               FROM PARTPREVPLAN PPP1 '                   +#13+
                               '                                                               WHERE PPP1.IDPESSOA = PP.IDPESSOA '        +#13+
                               '                                                                 AND NVL(PPP1.FLGDESATIVADO, 0 )=0)) '    +#13+
                               '           OR NVL(PP.FLGDESATIVADO, 0)=0) AND '                                                           +#13+
                               '              PP.IDPESSJUR(+) = AT.IDPESSJUR AND '                                                        +#13+
                               '              PP.IDSITPART    = SP.IDSITPART(+) '                                                         +#13+
                               '        GROUP BY ASS.NOME ' +#13+

                               //DAVID - Pendência 18425
                               ' UNION ' +#13+

                               ' SELECT COUNT(*),  ' +#13+

                               //David - CBS - 25/08/05
                               '        DECODE(TRIM(ASS.NOME), '''', ''PÁGINAS DO AUTO-ATENDIMENTO NÃO RELACIONADAS'', TRIM( ASS.NOME ) ), ' +#13+
                               //----------------------

                               '        ''                                                                                 '', '             +#13+
                               '        0, 0, 0, 0  '                                                    +#13+
                               ' FROM ( SELECT W.IDPESSOA AS IDTITULAR,  '                               +#13+
                               '               W.DATAHORA AS DATA,  '                                    +#13+
                               '               E.IDPESSJUR,  '                                           +#13+
                               '               W.IDPAGINA,  '                                            +#13+
                               '               P.DESCPAGINA,  '                                          +#13+
                               '               -1 AS CODATENDENTE,  '                                    +#13+
                               '               ''CONCLUÍDO'' AS STATUS,  '                               +#13+
                               '               -1 AS IDTIPOATEND  '                                      +#13+
                               '        FROM WEBPAGACESSADAS W,  '                                       +#13+
                               '             WEBPAGINA P,  '                                             +#13+
                               '             ELEGPATRO E  '                                              +#13+
                               '        WHERE  E.IDPESSOA = W.IDPESSOA  '                                +#13+
                               '          AND  W.IDPAGINA = P.IDPAGINA  '                                +#13+
                               '          AND  E.DATAADMISSAO = ( SELECT MAX(X.DATAADMISSAO) '           +#13+
                               '                                  FROM ELEGPATRO X '                     +#13+
                               '                                  WHERE X.IDPESSOA = W.IDPESSOA )) AT, ' +#13+
                               '      ( SELECT -1 AS IDLOCALATEND FROM DUAL ) LA,  '                     +#13+
                               '      PARTPREVPLAN PP, '                                                 +#13+
                               '      SITPART SP, '                                                      +#13+
                               '      ELEGPATRO EL, '                                                    +#13+
                               '      ASSUNTO ASS '                                                      +#13+
                               sAux +
                               ' WHERE  ' + SSQL1 +
                               '        EL.IDPESSOA    = AT.IDTITULAR  ' +

                               // DAVID - CBS - 25/08/05
                               '   AND  EL.IDPESSJUR   = AT.IDPESSJUR  ' +
                               //----------------------

                               '   AND  PP.IDPESSOA(+) = AT.IDTITULAR  ' +
                               '   AND  ( ( PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN ( SELECT PPP1.IDPESSOA  ' +
                               '                                                          FROM   PARTPREVPLAN PPP1  ' +
                               '                                                          WHERE  PPP1.IDPESSOA = PP.IDPESSOA  ' +
                               '                                                            AND  NVL( PPP1.FLGDESATIVADO, 0 ) = 0 ) )  ' +
                               '          OR NVL( PP.FLGDESATIVADO, 0 ) = 0 )  ' +
                               '   AND  AT.IDPESSJUR     = PP.IDPESSJUR (+)  ' +
                               '   and  pp.IDSITPART     = sp.IDSITPART (+)  ' +
                               '   and  at.IDPAGINA      = ass.IDPAGINA (+)  ' +
                               ' group by ass.NOME  ' +
                               ' ) z ' +
                               ' group by z.NOME, ' +
                               '          z.TOPICO ' +
                               ' order by 3 desc ';

            qryAux.Open;

            //DAVID - Pendência 18425
            //Previne linhas em branco
            while not qryAux.Eof do begin
              if (qryAux.FieldByName('CONTATEND').AsInteger=0) then begin
                qryAux.Delete;
                qryAux.First;
                Continue;
              end;

              qryAux.Next;
            end;

            qryGrafico.First;

            ContaRegistro := 1;
            Contador      := 0;

            qryAux.First;

            while not qryAux.Eof do begin
              if (Contador<StrToInt(wwSpinEdit.Text)+1) then begin
                Percent := (qryAux.FieldByName('CONTATEND').AsFloat*100)/TotalGeral;
                qryAux.Edit;

                if (Length(qryGrafico.FieldByName('NOME').AsString)>=35) then begin
                  qryAux.FieldByName('NOME').AsString := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+
                                                         Copy(qryAux.FieldByName('NOME').AsString,1,35);
                end else begin
                  qryAux.FieldByName('NOME').AsString := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+
                                                         qryAux.FieldByName('NOME').AsString+
                                                         StringOfChar(' ',35-Length(qryAux.FieldByName('NOME').AsString));
                end;

                sTempoMedio := ' (Tempo Méd = '+StringOfChar(' ',4-Length(FloatToStr(Round(qryAux.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat))))
                               +TempoFormatado(Round(qryAux.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat))+')';

                qryAux.FieldByName('TOPICO').AsString := qryAux.FieldByName('NOME').AsString+
                                                         StringOfChar(' ',81-(Length(sTempoMedio)+Length(qryAux.FieldByName('NOME').asString)+Length(FormatFloat('#,##',qryAux.FieldByName('CONTATEND').AsFloat))))
                                                         +sTempoMedio;

                TempoTotal := TempoTotal+qryAux.FieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

                qryAux.Post;
                qryAux.Next;
              end else begin
                if (qryAux.RecordCount>StrToInt(wwSpinEdit.Text)+1) then begin
                  qryAux.last;
                  qryAux.Delete;
                end else
                  qryAux.Next;
              end;

              Contador := Contador+1;
            end;

            ContaRegistro := 0;

            qryAux.Last;

            TotAtend := 0;

            while not (qryGrafico.Eof) do begin
              if (ContaRegistro>wwSpinEdit.Value+1) then begin
                qryAux.Last;
                TotAtend := TotAtend+qryGrafico.FieldByName('CONTATEND').AsFloat;
                Percent  := (TotAtend*100)/TotalGeral;

                if (qryAux.RecordCount>=wwSpinEdit.Value+1) then
                  qryAux.Delete;
              end;

              qryGrafico.Next;
              ContaRegistro := ContaRegistro+1;
            end;

            qryAux.Last;
            qryAux.Append;
            qryAux.FieldByName('NOME').AsString     := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+'OUTROS';
            qryAux.FieldByName('CONTATEND').AsFloat := TotAtend;
            qryAux.FieldByName('TOPICO').AsString   := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') '+
                                                       'OUTROS'+StringOfChar(' ',35);
            qryAux.Post;

            dsGrafico.Dataset := qryAux;
          end;
          // tavares 09/04/2002

        except
           raise;
        end; // end try

// Daniel - 23612 - Início -----------------------------------------------------
        if (ppTeeChart1.Chart.Series[0].Active=True) then begin
          ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
          ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
          ppTeeChart1.Chart.Series[0].XLabelsSource       := 'topico';      { <-- the Field for Bar Labels }

          if (TotalGeral>0) then
            ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
        end;

        if (ppTeeChart1.Chart.Series[1].Active=True) then begin
          ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
          ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';

          // tavares 10/04/2002
          ppTeeChart1.Chart.Series[1].XLabelsSource       := 'topico';

          if (TotalGeral>0) then
            ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
        end;
// Daniel - 23612 - Fim --------------------------------------------------------
      end; // end case "0"

    1:begin
        ppLabel1.Caption :=  '      Estatística de Atendimentos por Atendente     ';

        ZeraValores;

        if (DataIni.Text<>'') then
          sSql1 := sSql1+' AT.DATA >= TO_DATE('''+DataIni.Text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

        if (DataFin.Text<>'') then
          sSql1 := sSql1+' AT.DATA <= TO_DATE('''+DataFin.Text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

        if (cmbFilial.Text<>'') then begin
          sSql1          := sSql1+' EL.IDESTAB = '+cmbFilial.LookupValue+'  AND ';
          Filial.Caption := 'Filial: '+cmbFilial.Text;
        end else
          Filial.Caption := 'Filial: TODAS';

        if (cmbAtend.Text<>'') then begin
          sSql1             := sSql1+' AT.CODATENDENTE = '+cmbAtend.LookupValue+'  AND ';
          Atendente.Caption := 'Atendente: '+cmbAtend.Text;
        end else
          Atendente.Caption := 'Atendente: TODOS';

        if (cmbStatus.Text<>'') then begin
          sSql1          := sSql1+' AT.STATUS = '''+Trim(cmbStatus.Text)+'''  AND ';
          Status.Caption := 'Status: '+cmbStatus.Text;
        end else
          Status.Caption := 'Status: TODOS';

        if (cmbForma.Text<>'') then begin
          sSql1         := sSql1+' AT.IDTIPOATEND = '+cmbForma.LookupValue+'  AND ';
          Forma.Caption := 'Forma de Atendimento: '+cmbForma.Text;
        end else
          Forma.Caption := 'Forma de Atendimento: TODAS';

        if (cmbPlanPrev.Text<>'') then begin
          sSql1         := sSql1+' PP.IDPLANOPREV = '+cmbPlanPrev.LookupValue+'  AND ';
          Plano.Caption := 'Plano: '+CmbPlanPrev.Text;
        end else
          Plano.Caption := 'Plano: TODOS';

        if (cmbSitcad.Text<>'') then begin
          sSql1            := sSql1+' SP.IDSITPART = '+cmbSitcad.LookupValue+'  AND ';
          Situacao.Caption := 'Situação na Fundação: '+cmbSitcad.Text;
        end else
          Situacao.Caption := 'Situação na Fundação: TODAS';

        if (cmbAssunto.Text<>'') then begin
          sSql1           := sSql1+' ASS.IDASSUNTO = '+cmbAssunto.LookupValue+'  AND ';
          Assunto.Caption := 'Assunto: '+cmbAssunto.Text;
        end else
          Assunto.Caption := 'Assunto: TODOS';

        if (cmbPatro.Text<>'') then begin
          sSql1                 := sSql1+' AT.IDPESSJUR = '+cmbPatro.LookupValue+'  AND ';
          Patrocinadora.Caption := 'Patrocinadora: '+cmbPatro.Text;
        end else
          Patrocinadora.Caption := 'Patrocinadora: TODAS';

        if (cmbLocal.Text<>'') then begin
          sSql1         := sSql1+' LA.IDLOCALATEND = '+cmbLocal.LookupValue+'  AND ';
          Local.Caption := 'Local de Atendimento: '+cmbLocal.Text;
        end else
          Local.Caption := 'Local de Atendimento: TODOS';

        if (cmbGrupoAssunto.Text<>'') then begin
          sSql1         := sSql1+' ASS.IDGRUPOASSUNTO = '+cmbGrupoAssunto.LookupValue+'  AND ';
          Grupo.Caption := 'Grupo de Assunto: '+cmbGrupoAssunto.Text;
        end else
          Grupo.Caption := 'Grupo de Assunto: TODOS';

        if (dblkCidade.Text<>'') then begin
          sSql1          := sSql1+' EP.IDCIDADES = '+dblkCidade.LookUpValue   +
                                  ' AND ep.idcidades = CID.idcidades(+) AND ' +
                                  ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
          sAux           := ' ,Endpess EP, cidades CID ';
          Cidade.Caption := 'Cidade: '+ dblkCidade.Text;
        end else
          Cidade.Caption := 'Cidade: TODAS';

        qryGrafico.Close;
        qryGrafico.SQL.Clear;
        qryGrafico.SQL.Text :=
                  ' SELECT  /*+RULE*/ ' +
                  '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, US.NOMEUSUARIO, '+
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                  '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS, ' +
                  '     ''                                                                                 '' as Legenda ' +
                  '   FROM ' +
                  '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, USUARIOSISTEMA US, LOCALATENDXCPU LA ' + sAux+
                  '   WHERE ' + sSql1 +
                  '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                  '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                  '     US.IDUSUARIO = AT.CODATENDENTE AND ' +
                  '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                  '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                  '     AST.IDATEND = AT.IDATEND AND ' +
                  '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                  ' ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN '+
                  ' (SELECT PPP1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPESSOA AND NVL(PPP1.FLGDESATIVADO, 0) = 0)) '+
                  ' or nvl(pp.flgdesativado, 0) = 0) and '+
                  '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                  '     PP.IDSITPART = SP.IDSITPART(+) ' +
                  '   GROUP BY  US.NOMEUSUARIO ' +
                  //DAVID - Pendência 18425
                  ' UNION ' +
                  ' SELECT COUNT(*), ' +
                  '        ''AUTO-ATENDIMENTO'', ' +
                  '        0, 0, 0, 0, '' '' ' +
                  ' FROM   ( SELECT W.IDPESSOA AS IDTITULAR, ' +
                  '                 W.DATAHORA AS DATA, ' +
                  '                 E.IDPESSJUR, ' +
                  '                 W.IDPAGINA, ' +
                  '                 P.DESCPAGINA, ' +
                  '                 -1 AS CODATENDENTE, ' +
                  '                 ''CONCLUÍDO'' AS STATUS, ' +
                  '                 -1 AS IDTIPOATEND ' +
                  '          FROM   WEBPAGACESSADAS W, ' +
                  '                 WEBPAGINA P, ' +
                  '                 ELEGPATRO E ' +
                  '          WHERE  E.IDPESSOA = W.IDPESSOA ' +
                  '            AND  W.IDPAGINA = P.IDPAGINA ' +
                  '            AND  E.DATAADMISSAO = ( SELECT MAX( X.DATAADMISSAO ) ' +
                  '                                    FROM   ELEGPATRO X ' +
                  '                                    WHERE  X.IDPESSOA = W.IDPESSOA ) ) AT, ' +
                  '        ( SELECT -1 AS IDLOCALATEND FROM DUAL ) LA, ' +
                  '        PARTPREVPLAN PP, ' +
                  '        SITPART SP, ' +
                  '        ELEGPATRO EL, ' +
                  '        ASSUNTO ASS ' +
                  sAux +
                  ' WHERE ' + sSql1 +
                  '        EL.IDPESSOA    = AT.IDTITULAR ' +

                  //DAVID - CBS - 25/08/05
                  '   AND  EL.IDPESSJUR   = AT.IDPESSJUR  ' +
                  //----------------------

                  '   AND  PP.IDPESSOA(+) = AT.IDTITULAR ' +
                  '   AND  ( ( PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN ( SELECT PPP1.IDPESSOA ' +
                  '                                                          FROM   PARTPREVPLAN PPP1 ' +
                  '                                                          WHERE  PPP1.IDPESSOA = PP.IDPESSOA ' +
                  '                                                            AND  NVL( PPP1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                  '          OR NVL( PP.FLGDESATIVADO, 0 ) = 0 ) ' +
                  '   AND  AT.IDPESSJUR     = PP.IDPESSJUR (+) ' +
                  '   AND  PP.IDSITPART     = SP.IDSITPART (+) ' +
                  '   AND  AT.IDPAGINA      = ASS.IDPAGINA (+) ' ;

        try
          qryGrafico.Open;

          //DAVID - Pendência 18425
          //Previne linhas em branco
          while not qryGrafico.Eof do begin
            if (qryGrafico.FieldByName('CONTATEND').AsInteger=0) then begin
              qryGrafico.Delete;
              qryGrafico.First;
              Continue;
            end;

            qryGrafico.Next;
          end;

          Totaliza;

          qryGrafico.First;

          TempoTotal := 0;

          while not qryGrafico.Eof do begin
            Percent := (qryGrafico.FieldByName('CONTATEND').AsFloat*100)/TotalGeral;
            qryGrafico.Edit;

            qryGrafico.FieldByName('LEGENDA').AsString := ' ('+FormatFloat('#,##0.00',Percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                          qryGrafico.FieldByName('NOMEUSUARIO').AsString;

            sTempoMedio :=  ' (Tempo Méd = '+StringOfChar(' ',4-Length(FloatToStr(Round(qryGrafico.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat))))
                            +TempoFormatado(Round(qryGrafico.FieldByName('MEDIA_EM_SEGUNDOS').AsFloat)) + ')';


            qryGrafico.FieldByName('LEGENDA').AsString := qryGrafico.FieldByName('LEGENDA').AsString+
                                                          StringOfChar(' ',81-Length(FormatFloat('#,##',qryGrafico.FieldByName('CONTATEND').AsFloat)+qryGrafico.FieldByName('LEGENDA').AsString+sTempoMedio))
                                                          +sTempoMedio;

            TempoTotal := TempoTotal+qryGrafico.FieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

            qryGrafico.Post;
            qryGrafico.Next;
          end;

          qryGrafico.First;

        except
          on E:EDBEngineError do begin
           raise;
        end; // end try
      end; // end case "1"

// Daniel - 23612 - Início -----------------------------------------------------
      if (ppTeeChart1.Chart.Series[0].Active=True) then begin
        ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
        ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';    { <-- the Field for Bar Values }
        ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';      { <-- the Field for Bar Labels }

        if (TotalGeral>0) then
          ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
      end;

      if (ppTeeChart1.Chart.Series[1].Active=True) then begin
        ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
        ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
        ppTeeChart1.Chart.Series[1].XLabelsSource       := 'Legenda';

        if (TotalGeral>0) then
          ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
      end;

      end;
// Daniel - 23612 - Fim --------------------------------------------------------

      2:begin
          ppLabel1.Caption := '      Estatística de Atendimentos por Status       ';

          ZeraValores;

             if dataini.text <> '' then
                ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if datafin.text <> '' then
                ssql1 := ssql1 + '   AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';
             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';


             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
              end
              else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';

             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             If cmbpatro.text <> '' Then
             begin
               ssql1 := ssql1 + ' AT.IDPESSJUR = ' + cmbpatro.Lookupvalue + '  AND ';
               Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
              end
              else Local.Caption := 'Local de Atendimento: TODOS';

             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                                 ' AND ep.idcidades = CID.idcidades(+) AND '+
                                 ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
                sAux := ' ,Endpess EP, cidades CID ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: TODAS';


             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       //DAVID - Pendência 18425
                       ' select z.STATUS, ' +
                       '        z.LEGENDA, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  /*+RULE*/ ' +
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, AT.STATUS,  '+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS, ' +
                       '     ''                                                                                 '' as Legenda ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND '+
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) ' +
                       '   GROUP BY  AT.STATUS ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +

                       //David - CBS - 25/08/05
                       '        trim( at.STATUS ), ' +
                       //----------------------

                       '        0, 0, 0, 0, ' +
                       '     ''                                                                                 '' ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' group by z.STATUS, ' +
                       '          z.LEGENDA ' +
                       ' order by 3 desc ';

             try
                  qrygrafico.Open;

                  //DAVID - Pendência 18425
                  //Previne linhas em branco
                  while not qrygrafico.Eof do
                  begin
                    if qryGrafico.FieldByName('CONTATEND').AsInteger = 0 then
                    begin
                      qryGrafico.Delete;
                      qryGrafico.First;
                      Continue;
                    end;
                    qryGrafico.Next;
                  end;

                  Totaliza;

                  qrygrafico.First;
                  while not qrygrafico.Eof do
                  begin
                    percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
                    qrygrafico.Edit;

                    qrygrafico.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                      qrygrafico.fieldByName('STATUS').asString;

                    stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                                    + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';


                    qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('Legenda').asString +
                                                                  stringOfChar(' ', 81 - length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat) + qrygrafico.fieldByName('Legenda').asString + sTempoMedio))
                                                                  + sTempoMedio;

                    TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

                    qrygrafico.Post;
                    qrygrafico.next;
                  end;
                  qrygrafico.First;

             except
             on E:EDBEngineError do
             begin
                RAISE;

             end;
          end;

// Daniel - 23612 - Início -----------------------------------------------------
          if (ppTeeChart1.Chart.Series[0].Active=True) then begin
            ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
            ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
            ppTeeChart1.Chart.Series[0].XLabelsSource       := 'LEGENDA';     { <-- the Field for Bar Labels }

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          if (ppTeeChart1.Chart.Series[1].Active=True) then begin
             ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
             ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
             ppTeeChart1.Chart.Series[1].XLabelsSource       := 'LEGENDA';

             if (TotalGeral>0) then
               ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          end;
// Daniel - 23612 - Fim --------------------------------------------------------

          3:
          begin
             ppLabel1.Caption :=  ' Estatística de Atendimentos por Forma de Atendimento ';

             zeravalores;

             if dataini.text <> '' then
                ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if datafin.text <> '' then
                ssql1 := ssql1 + '  AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';

             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
             end
             else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';

             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             If cmbpatro.text <> '' Then
             begin
               ssql1 := ssql1 + ' AT.IDPESSJUR = ' + cmbpatro.Lookupvalue + '  AND ';
               Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
              end
              else Local.Caption := 'Local de Atendimento: TODOS';


             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                                 ' AND ep.idcidades = CID.idcidades(+) AND '+
                                 ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
                sAux := ' ,Endpess EP, cidades CID ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: TODAS';

             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       ' SELECT   /*+RULE*/  ' +
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, TP.NOME, '+
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS, ' +
                       '     ''                                                                                 '' as Legenda ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND '+
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) ' +
                       '   GROUP BY TP.NOME ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ''Auto-Atendimento'', ' +
                       '        0, 0, 0, 0, ' +
                       '     ''                                                                                 '' ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

                       '   and  pp.IDPESSOA(+) = at.IDTITULAR ' +
                       '   and  ( ( pp.FLGDESATIVADO = 1 and pp.IDPESSOA not in ( select ppp1.IDPESSOA ' +
                       '                                                          from   PARTPREVPLAN ppp1 ' +
                       '                                                          where  ppp1.IDPESSOA = pp.IDPESSOA ' +
                       '                                                            and  nvl( ppp1.FLGDESATIVADO, 0 ) = 0 ) ) ' +
                       '          or nvl( pp.FLGDESATIVADO, 0 ) = 0 ) ' +
                       '   and  at.IDPESSJUR     = pp.IDPESSJUR (+) ' +
                       '   and  pp.IDSITPART     = sp.IDSITPART (+) ' +
                       '   and  at.IDPAGINA      = ass.IDPAGINA (+) ' ;

             try
                  qrygrafico.Open;

                  //DAVID - Pendência 18425
                  //Previne linhas em branco
                  while not qrygrafico.Eof do
                  begin
                    if qryGrafico.FieldByName('CONTATEND').AsInteger = 0 then
                    begin
                      qryGrafico.Delete;
                      qryGrafico.First;
                      Continue;
                    end;
                    qryGrafico.Next;
                  end;

                  Totaliza;

                  qrygrafico.First;
                  while not qrygrafico.Eof do
                  begin
                    percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
                    qrygrafico.Edit;

                    qrygrafico.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                      qrygrafico.fieldByName('NOME').asString;

                    stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                                    + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';


                    qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('Legenda').asString +
                                                                  stringOfChar(' ', 81 - length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat) + qrygrafico.fieldByName('Legenda').asString + sTempoMedio))
                                                                  + sTempoMedio;

                    TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

                    qrygrafico.Post;
                    qrygrafico.next;
                  end;
                  qrygrafico.First;

             except
             on E:EDBEngineError do
             begin
                RAISE;

             end;
          end;

// Daniel - 23612 - Início -----------------------------------------------------
          if (ppTeeChart1.Chart.Series[0].Active=True) then begin
            ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
            ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
            ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';     { <-- the Field for Bar Labels }

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          if (ppTeeChart1.Chart.Series[1].Active=True) then begin
            ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
            ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
            ppTeeChart1.Chart.Series[1].XLabelsSource       := 'Legenda';

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          end;
// Daniel - 23612 - Fim --------------------------------------------------------

          4:
          begin
             ppLabel1.Caption :=  '       Estatística de Atendimentos por Patrocinadora       ';

             zeravalores;

             if dataini.text <> '' then
                ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if datafin.text <> '' then
                ssql1 := ssql1 + ' AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';
             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';


             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
             end
             else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';

             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbpatro.text <> '' Then
             begin
               ssql1 := ssql1 + ' AT.IDPESSJUR = ' + cmbpatro.Lookupvalue + '  AND ';
               Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
              end
              else Local.Caption := 'Local de Atendimento: TODOS';

             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                                 ' AND ep.idcidades = CID.idcidades(+) AND '+
                                 ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
                sAux := ' ,Endpess EP, cidades CID ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: TODAS';

             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       //DAVID - Pendência 18425
                       ' select z.NOME, ' +
                       '        z.LEGENDA, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  /*+RULE*/ ' +
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, '+
                       '     PES.NOME, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS, ' +
                       '     ''                                                                                 '' as Legenda ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, PESSOA PES, LOCALATENDXCPU LA ' + sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND '+
                       '     PES.IDPESSOA = AT.IDPESSJUR AND ' +
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) ' +
                       '   GROUP BY PES.NOME ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +

                       //David - CBS - 25/08/05
                       '        trim( pes.NOME ), ' +
                       //----------------------

                       '        0, 0, 0, 0, ' +
                       '        ''                                                                                 '' ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' group by z.NOME, ' +
                       '          z.LEGENDA ' +
                       ' order by 3 desc ';

             try
                  qrygrafico.Open;

                  //DAVID - Pendência 18425
                  //Previne linhas em branco
                  while not qrygrafico.Eof do
                  begin
                    if qryGrafico.FieldByName('CONTATEND').AsInteger = 0 then
                    begin
                      qryGrafico.Delete;
                      qryGrafico.First;
                      Continue;
                    end;
                    qryGrafico.Next;
                  end;

                  Totaliza;

                  qrygrafico.First;
                  while not qrygrafico.Eof do
                  begin
                    percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
                    qrygrafico.Edit;

                    qrygrafico.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                      qrygrafico.fieldByName('NOME').asString;

                    stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                                    + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';


                    qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('Legenda').asString +
                                                                  stringOfChar(' ', 81 - length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat) + qrygrafico.fieldByName('Legenda').asString + sTempoMedio))
                                                                  + sTempoMedio;

                    TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

                    qrygrafico.Post;
                    qrygrafico.next;
                  end;
                  qrygrafico.First;

             except
             on E:EDBEngineError do
             begin
                RAISE;

             end;
          end;

// Daniel - 23612 - Início -----------------------------------------------------
          if (ppTeeChart1.Chart.Series[0].Active=True) then begin
            ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
            ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
            ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';     { <-- the Field for Bar Labels }

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          if (ppTeeChart1.Chart.Series[1].Active=True) then begin
            ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
            ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
            ppTeeChart1.Chart.Series[1].XLabelsSource       := 'Legenda';

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado( round(TempoTotal/TotalTempoMedio) );
          end;

          end;
// Daniel - 23612 - Fim --------------------------------------------------------

          5:
          begin
             ppLabel1.Caption := '    Estatística de Atendimentos por Local de Atendimento   ';

             zeravalores;

             if dataini.text <> '' then
               ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';
             if datafin.text <> '' then
                ssql1 := ssql1 + ' AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';
             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';


             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
             end
             else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';

             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbpatro.text <> '' Then
             begin
               ssql1 := ssql1 + ' AT.IDPESSJUR = ' + cmbpatro.Lookupvalue + '  AND ';
               Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
              end
              else Local.Caption := 'Local de Atendimento: TODOS';

             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                                 ' AND ep.idcidades = CID.idcidades(+) AND '+
                                 ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
                sAux := ' ,Endpess EP, cidades CID ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: TODAS';

             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       ' SELECT  /*+RULE*/  ' +
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, '+
                       '     LAT.DESCLOCALATEND AS NOME, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS, ' +
                       '     ''                                                                                 '' as Legenda ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, PESSOA PES, LOCALATENDXCPU LA, LOCALATEND LAT ' + sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND '+
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     LA.IDLOCALATEND = LAT.IDLOCALATEND AND ' +
                       '     PES.IDPESSOA = AT.IDPESSJUR AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) ' +
                       '   GROUP BY LAT.DESCLOCALATEND ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +
                       '        ''Auto-Atendimento'', ' +
                       '        0, 0, 0, 0, ' +
                       '        ''                                                                                 '' ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' order by 1 desc ';

             try
                  qrygrafico.Open;

                  //DAVID - Pendência 18425
                  //Previne linhas em branco
                  while not qrygrafico.Eof do
                  begin
                    if qryGrafico.FieldByName('CONTATEND').AsInteger = 0 then
                    begin
                      qryGrafico.Delete;
                      qryGrafico.First;
                      Continue;
                    end;
                    qryGrafico.Next;
                  end;

                  Totaliza;

                  qrygrafico.First;
                  while not qrygrafico.Eof do
                  begin
                    percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
                    qrygrafico.Edit;

                    qrygrafico.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                      qrygrafico.fieldByName('NOME').asString;

                    stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                                    + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';


                    qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('Legenda').asString +
                                                                  stringOfChar(' ', 81 - length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat) + qrygrafico.fieldByName('Legenda').asString + sTempoMedio))
                                                                  + sTempoMedio;

                    TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

                    qrygrafico.Post;
                    qrygrafico.next;
                  end;
                  qrygrafico.First;

             except
             on E:EDBEngineError do
             begin
                RAISE;

             end;
          end;

// Daniel - 23612 - Início -----------------------------------------------------
          if (ppTeeChart1.Chart.Series[0].Active=True) then begin
            ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
            ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
            ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';     { <-- the Field for Bar Labels }

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          if (ppTeeChart1.Chart.Series[1].Active=True) then begin
            ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
            ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
            ppTeeChart1.Chart.Series[1].XLabelsSource       := 'Legenda';

            if (TotalGeral>0) then
              ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
          end;

          end;
// Daniel - 23612 - Fim --------------------------------------------------------

          6:
          begin
             ppLabel1.Caption :=  '     Estatística de Atendimentos por Grupo de Assunto     ';

             zeravalores;

             if dataini.text <> '' then
                ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if datafin.text <> '' then
                ssql1 := ssql1 + ' AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';


             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
             end
             else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';


             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             if cmbpatro.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDPESSJUR = '+cmbpatro.lookupvalue+'  AND ';
                Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
             end
             else Local.Caption := 'Local de Atendimento: TODOS';

             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +
                                 ' AND ep.idcidades = CID.idcidades(+) AND '+
                                 ' EP.IDPESSOA(+) = AT.IDTITULAR AND ';
                sAux := ' ,Endpess EP, cidades CID ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: TODAS';

             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       //DAVID - Pendência 18425
                       ' select z.DESCGRUPOASSUNTO, ' +
                       '        z.LEGENDA, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  /*+RULE*/ ' +
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, ' +
                       '     GA.DESCGRUPOASSUNTO, ' +
                       '     ''                                                                                 '' as Legenda, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, GRUPOASSUNTO  GA, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA  ' + sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) AND ' +
                       '     GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO ' +
                       '   GROUP BY GA.DESCGRUPOASSUNTO ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +

                       //David - CBS - 25/08/05
                       '        trim( ga.DESCGRUPOASSUNTO ), ' +
                       //----------------------

                       '        ''                                                                                 '', ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' group by z.DESCGRUPOASSUNTO, ' +
                       '          z.LEGENDA ' +
                       ' order by 3 desc ';

             Try

          qrygrafico.Open;

          //DAVID - Pendência 18425
          //Previne linhas em branco
          while not qrygrafico.Eof do
          begin
            if qryGrafico.FieldByName('CONTATEND').AsInteger = 0 then
            begin
              qryGrafico.Delete;
              qryGrafico.First;
              Continue;
            end;
            qryGrafico.Next;
          end;

          Totaliza;
          qrygrafico.First;
          TempoTotal := 0;
          while not qrygrafico.Eof do
          begin
            percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
            qrygrafico.Edit;

            if length(qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString) >= 35 then
            begin
              qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                              copy(qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString, 1, 35);
            end
            else
            begin
              qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                              qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString +
                                                              stringOfChar(' ', 35 - length(qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString));
            end;

            stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                            + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';

            qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString +
                                                          stringOfChar(' ', 81 -(length(stempoMedio)+length(qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString)
                                                        + length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat))))
                                                        + sTempoMedio;

            TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

            qrygrafico.Post;
            qrygrafico.next;
          end;
          qrygrafico.First;

                // Tavares 09/04/2002
                // por assunto
                if (qrygrafico.RecordCount > wwSpinEdit.Value) and (RgOpcoes.itemindex = 6) then
                begin
                  qryAux.Close;
                  qryAux.sql.clear;
                  qryAux.sql.Text :=
                       //DAVID - Pendência 18425
                       ' select z.DESCGRUPOASSUNTO, ' +
                       '        z.LEGENDA, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  /*+RULE*/ ' +
                       '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, GA.DESCGRUPOASSUNTO, ' +
                       '     ''                                                                                 '' as Legenda, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, GRUPOASSUNTO  GA, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA  '+ sAux+
                       '   WHERE ' + SSQL1 +
                       '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) AND ' +
                       '     GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO ' +
                       '   GROUP BY GA.DESCGRUPOASSUNTO ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +

                       //David - CBS - 25/08/05
                       '        trim( ga.DESCGRUPOASSUNTO ), ' +
                       //----------------------

                       '        ''                                                                                 '', ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' group by z.DESCGRUPOASSUNTO, ' +
                       '          z.LEGENDA ' +
                       ' order by 3 desc ';
                       
                  qryAux.Open;

                  //DAVID - Pendência 18425
                  //Previne linhas em branco
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

                  qrygrafico.first;
                  contaRegistro := 1;
                  contador := 0;
                  qryAux.First;
                  while not qryAux.Eof do
                  begin
                    if contador < strToInt(wwSpinEdit.text)+1 then
                    begin
                      percent := (qryAux.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
                      qryAux.Edit;

                      if length(qrygrafico.fieldByName('DESCGRUPOASSUNTO').asString) >= 35 then
                      begin
                        qryAux.fieldByName('DESCGRUPOASSUNTO').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                        copy(qryAux.fieldByName('DESCGRUPOASSUNTO').asString, 1, 35);
                      end
                      else
                      begin
                        qryAux.fieldByName('DESCGRUPOASSUNTO').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                        qryAux.fieldByName('DESCGRUPOASSUNTO').asString +
                                                                        stringOfChar(' ', 35 - length(qryAux.fieldByName('DESCGRUPOASSUNTO').asString));
                      end;

                      stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qryAux.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                                      + TempoFormatado( round(qryAux.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';

                      qryAux.fieldByName('Legenda').asString := qryAux.fieldByName('DESCGRUPOASSUNTO').asString +
                                                                   stringOfChar(' ', 81 -(length(stempoMedio)+length(qryAux.fieldByName('DESCGRUPOASSUNTO').asString)+ length(formatFloat('#,##',qryAux.fieldByName('CONTATEND').asFloat))))
                                                                   + sTempoMedio;
                      TempoTotal := TempoTotal + qryAux.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;


                      qryAux.Post;
                      qryAux.next;
                    end
                    else
                    begin
                       if qryaux.RecordCount > strToInt(wwSpinEdit.text)+1 then
                       begin
                         qryAux.last;
                         qryAux.Delete;
                       end
                       else
                         qryAux.Next;
                     end;
                    contador := contador + 1;
                  end;

                  contaRegistro := 0;
                  qryAux.Last;
                  TotAtend := 0;
                  while not qrygrafico.eof do
                  begin
                    if contaRegistro > wwSpinEdit.Value + 1 then
                    begin
                      qryAux.Last;
                      TotAtend := TotAtend + qryGrafico.fieldByName('CONTATEND').asFloat;
                      percent := (TotAtend * 100) / TotalGeral;
                      if qryAux.recordCount >= wwSpinEdit.Value + 1 then
                        qryAux.Delete;
                    end;
                    qrygrafico.next;
                    contaRegistro := contaRegistro + 1;
                  end;
                  qryAux.Last;
                  qryAux.Append;
                  qryAux.fieldByName('DESCGRUPOASSUNTO').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') '+'OUTROS';
                  qryAux.fieldByName('CONTATEND').asFloat := TotAtend;
                  qryAux.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                              'OUTROS' + stringOfChar(' ', 35);
                  qryAux.Post;
                  dsGrafico.Dataset := qryAux;


               end;
             Except
                RAISE;
             End;

// Daniel - 23612 - Início -----------------------------------------------------
             if (ppTeeChart1.Chart.Series[0].Active=True) then begin
               ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
               ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
               ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';     { <-- the Field for Bar Labels }

               if (TotalGeral>0) then
                 ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
             end;

             if (ppTeeChart1.Chart.Series[1].Active=True) then begin
               ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
               ppTeeChart1.Chart.Series[1].YValues.ValueSource := 'CONTATEND';
               ppTeeChart1.Chart.Series[1].XLabelsSource       := 'Legenda';

               if (TotalGeral>0) then
                 ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
             end;

          end;
// Daniel - 23612 - Fim --------------------------------------------------------

//************************************

          7:  // por cidades
          begin
             ppLabel1.Caption :=  '     Estatística de Atendimentos por Cidades     ';

             zeravalores;

             if dataini.text <> '' then
                ssql1 := ssql1 + ' AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if datafin.text <> '' then
                ssql1 := ssql1 + ' AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') AND ';

             if cmbfilial.text <> '' then
             begin
                ssql1 := ssql1 + ' EL.IDESTAB = '+cmbfilial.lookupvalue+' AND ';
                Filial.Caption := 'Filial: '+cmbfilial.text;
             end
             else Filial.Caption := 'Filial: TODAS';


             if cmbatend.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.CODATENDENTE = '+cmbatend.Lookupvalue+'  AND ';
                Atendente.Caption := 'Atendente: '+cmbatend.text;
             end
             else  Atendente.Caption := 'Atendente: TODOS';

             if cmbstatus.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.STATUS = '''+TRIM(cmbstatus.text)+'''  AND ';
                Status.Caption := 'Status: '+cmbstatus.text;
             end
             else Status.Caption := 'Status: TODOS';

             if cmbforma.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDTIPOATEND = '+cmbforma.LookupValue+'  AND ';
                forma.Caption := 'Forma de Atendimento: '+cmbforma.text;
             end
             else forma.Caption := 'Forma de Atendimento: TODAS';

             If CmbPlanPrev.text <> '' Then
             begin
               ssql1 := ssql1 + ' PP.IDPLANOPREV = ' + CmbPlanPrev.Lookupvalue + '  AND ';
               Plano.Caption := 'Plano: '+CmbPlanPrev.text;
             end
             else Plano.Caption := 'Plano: TODOS';


             If CmbSitcad.text <> '' Then
             begin
               ssql1 := ssql1 + ' SP.IDSITPART = ' + CmbSitcad.Lookupvalue + '  AND ';
               Situacao.Caption := 'Situação na Fundação: '+CmbSitcad.text;
             end
             else Situacao.Caption := 'Situação na Fundação: TODAS';

             If cmbassunto.text <> '' Then
             begin
               ssql1 := ssql1 + ' ASS.IDASSUNTO = ' + cmbassunto.Lookupvalue + '  AND ';
               assunto.Caption := 'Assunto: '+cmbassunto.text;
             end
             else assunto.Caption := 'Assunto: TODOS';

             if cmbpatro.text <> '' then
             begin
                ssql1 := ssql1 + ' AT.IDPESSJUR = '+cmbpatro.lookupvalue+'  AND ';
                Patrocinadora.Caption := 'Patrocinadora: '+cmbpatro.text;
             end
             else Patrocinadora.Caption := 'Patrocinadora: TODAS';

             if CmbLocal.text <> '' then
             begin
                ssql1 := ssql1 + ' LA.IDLOCALATEND = '+CmbLocal.lookupvalue+'  AND ';
                Local.Caption := 'Local de Atendimento: '+CmbLocal.text;
             end
             else Local.Caption := 'Local de Atendimento: TODOS';

             if CmbGrupoAssunto.text <> '' then
             begin
                ssql1 := ssql1 + ' ASS.IDGRUPOASSUNTO = '+CmbGrupoAssunto.lookupvalue+'  AND ';
                Grupo.Caption := 'Grupo de Assunto: '+CmbGrupoAssunto.text;
             end
             else Grupo.Caption := 'Grupo de Assunto: TODOS';

             if dblkCidade.text <> '' then
             begin
                ssql1 := ssql1 + ' EP.IDCIDADES = '+ dblkCidade.LookUpValue +' AND ';
                cidade.Caption := 'Cidade: '+ dblkCidade.Text;
             end
             else cidade.Caption := 'Cidade: As '+ FloatToStr(DBSpinEditQtdCidades.Value) + ' mais signifiantes ';

             qrygrafico.close;
             qrygrafico.sql.clear;
             qrygrafico.sql.Text :=
                       //DAVID - Pendência 18425
                       ' select z.CIDADES, ' +
                       '        z.LEGENDA, ' +
                       '        sum( z.CONTATEND         ) as CONTATEND, ' +
                       '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                       '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                       '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                       '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                       ' from ( ' +
                       ' SELECT  /*+RULE*/ ' +
                       '     DISTINCT COUNT (AT.IDATEND) AS CONTATEND, '+
                       '     NVL(CID.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS CIDADES, ' +
                       '     ''                                                                                 '' as Legenda, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                       '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                       '   FROM ' +
                       '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, GRUPOASSUNTO  GA, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA, ENDPESS EP, CIDADES CID '+
                       '   WHERE ' + SSQL1 +
                       '     EP.IDCIDADES = CID.IDCIDADES(+) AND '+
                       '     EP.IDPESSOA(+) = AT.IDTITULAR AND '+
                       '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                       '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                       '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                       '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                       '     AST.IDATEND = AT.IDATEND AND ' +
                       '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                       ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                       ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                       ' or nvl(pp.flgdesativado, 0) = 0) and '+
                       '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                       '     PP.IDSITPART = SP.IDSITPART(+) AND ' +
                       '     GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO ' +
                       '   GROUP BY NVL(CID.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') ' +
                       //DAVID - Pendência 18425
                       ' union ' +
                       ' select COUNT(*), ' +

                       //David - CBS - 25/08/05
                       '        nvl( trim( cid.NOME ), ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS CIDADES, ' +
                       //----------------------

                       '        ''                                                                                 '', ' +
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
                       ' where ' + SSQL1 +
                       '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                       ' group by nvl( trim( cid.NOME ), ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') ' +
                       ' ) z ' +
                       ' group by z.CIDADES, ' +
                       '          z.LEGENDA ' +
                       ' order by 3 desc ';

          qrygrafico.Open;
          Totaliza;
          qrygrafico.First;
          TempoTotal := 0;
          while not qrygrafico.Eof do
          begin
            percent := (qrygrafico.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
            qrygrafico.Edit;

            if length(qrygrafico.fieldByName('CIDADES').asString) >= 35 then
            begin
              qrygrafico.fieldByName('CIDADES').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                              copy(qrygrafico.fieldByName('CIDADES').asString, 1, 35);
            end
            else
            begin
              qrygrafico.fieldByName('CIDADES').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                              qrygrafico.fieldByName('CIDADES').asString +
                                                              stringOfChar(' ', 35 - length(qrygrafico.fieldByName('CIDADES').asString));
            end;

            stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                            + TempoFormatado( round(qrygrafico.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';

            qrygrafico.fieldByName('Legenda').asString := qrygrafico.fieldByName('CIDADES').asString +
                                                          stringOfChar(' ', 81 -(length(stempoMedio)+length(qrygrafico.fieldByName('CIDADES').asString)
                                                        + length(formatFloat('#,##',qrygrafico.fieldByName('CONTATEND').asFloat))))
                                                        + sTempoMedio;

            TempoTotal := TempoTotal + qrygrafico.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;

            qrygrafico.Post;
            qrygrafico.next;
          end;
          qrygrafico.First;


//****************** PENDÊNCIA 9206
      if (qrygrafico.RecordCount > DBSpinEditQtdCidades.Value) and (RgOpcoes.itemindex = 7) then
      begin
        qryAux.Close;
        qryAux.sql.clear;
        qryAux.sql.Text :=
                     //DAVID - Pendência 18425
                     ' select z.CIDADES, ' +
                     '        z.LEGENDA, ' +
                     '        sum( z.CONTATEND         ) as CONTATEND, ' +
                     '        sum( z.TOTAL_EM_SEGUNDOS ) as TOTAL_EM_SEGUNDOS, ' +
                     '        sum( z.MEDIA_EM_SEGUNDOS ) as MEDIA_EM_SEGUNDOS, ' +
                     '        sum( z.TOTAL_EM_MINUTOS  ) as TOTAL_EM_MINUTOS, ' +
                     '        sum( z.MEDIA_EM_MINUTOS  ) as MEDIA_EM_MINUTOS ' +
                     ' from ( ' +
                     ' SELECT  /*+RULE*/ ' +
                     '    DISTINCT COUNT (AT.IDATEND) AS CONTATEND, '+
                     '    NVL(CID.NOME, ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS CIDADES, ' +
                     '     ''                                                                                 '' as Legenda, ' +
                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400),SUM((DATA - DATAINICIO) * 86400))                        AS TOTAL_EM_SEGUNDOS, ' +
                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND))      AS MEDIA_EM_SEGUNDOS, ' +
                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60),SUM((DATA - DATAINICIO) * 86400 / 60))                   AS TOTAL_EM_MINUTOS, ' +
                     '     DECODE(SIGN(SUM(DATA-DATAINICIO)),-1,SUM((DATAINICIO - DATA) * 86400 / 60)/COUNT(AT.IDATEND),SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND)) AS MEDIA_EM_MINUTOS ' +
                     '   FROM ' +
                     '     ATEND AT , TIPOATEND TP , ASSUNTO ASS, GRUPOASSUNTO  GA, ASSUNTOXATEND AST, PARTPREVPLAN PP, SITPART SP, ELEGPATRO EL, LOCALATENDXCPU LA, ENDPESS EP, CIDADES CID '+
                     '   WHERE ' + SSQL1 +
                     '     EP.IDCIDADES = CID.IDCIDADES(+) AND '+
                     '     EP.IDPESSOA(+) = AT.IDTITULAR AND '+
                     '     EL.IDPESSOA = AT.IDTITULAR  AND ' +
                     '     AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU AND ' +
                     '     AT.IDTIPOATEND = TP.IDTIPOATEND AND ' +
                     '     ASS.IDASSUNTO = AST.IDASSUNTO AND ' +
                     '     AST.IDATEND = AT.IDATEND AND ' +
                     '     PP.IDPESSOA(+) = AT.IDTITULAR AND ' +
                     ' ((pp.flgdesativado = 1 and PP.IDPESSOA not in '+
                     ' (select ppp1.idpessoa from partprevplan ppp1 where ppp1.idpessoa = pp.idpessoa and nvl(ppp1.flgdesativado, 0) = 0)) '+
                     ' or nvl(pp.flgdesativado, 0) = 0) and '+
                     '     PP.IDPESSJUR(+) = AT.IDPESSJUR AND ' +
                     '     PP.IDSITPART = SP.IDSITPART(+) AND ' +
                     '     GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO ' +
                     '   GROUP BY CID.NOME ' +
                     //DAVID - Pendência 18425
                     ' union ' +
                     ' select COUNT(*), ' +

                     //David - CBS - 25/08/05
                     '        nvl( trim( cid.NOME ), ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') AS CIDADES, ' +
                     //----------------------

                     '        ''                                                                                 '', ' +
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
                     ' where ' + SSQL1 +
                     '        el.IDPESSOA    = at.IDTITULAR ' +

                       //David - CBS - 25/08/05
                       '   and  el.IDPESSJUR   = at.IDPESSJUR  ' +
                       //----------------------

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
                     ' group by nvl( trim( cid.NOME ), ''CIDADE NÃO IDENTIFICADA NO ATENDIMENTO'') ' +
                     ' ) z ' +
                     ' group by z.CIDADES, ' +
                     '          z.LEGENDA ' +
                     ' order by 3 desc ';

          qryAux.Open;

          //DAVID - Pendência 18425
          //Previne linhas em branco
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

          qrygrafico.first;
          contaRegistro := 1;
          contador := 0;
          qryAux.First;
          while not qryAux.Eof do
          begin
            if contador < strToInt(DBSpinEditQtdCidades.text)+1 then
            begin
              percent := (qryAux.fieldByName('CONTATEND').AsFloat * 100) / TotalGeral;
              qryAux.Edit;

              if length(qrygrafico.fieldByName('CIDADES').asString) >= 35 then
              begin
                qryAux.fieldByName('CIDADES').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                copy(qryAux.fieldByName('CIDADES').asString, 1, 35);
              end
              else
              begin
                qryAux.fieldByName('CIDADES').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                                qryAux.fieldByName('CIDADES').asString +
                                                                stringOfChar(' ', 35 - length(qryAux.fieldByName('CIDADES').asString));
              end;

              stempoMedio :=  ' (Tempo Méd = '+ StringOfChar(' ', 4 - length(FloatToStr(round(qryAux.fieldByName('MEDIA_EM_SEGUNDOS').asFloat))))
                              + TempoFormatado( round(qryAux.fieldByName('MEDIA_EM_SEGUNDOS').asFloat)) + ')';

              qryAux.fieldByName('Legenda').asString := qryAux.fieldByName('CIDADES').asString +
                                                           stringOfChar(' ', 81 -(length(stempoMedio)+length(qryAux.fieldByName('CIDADES').asString)+ length(formatFloat('#,##',qryAux.fieldByName('CONTATEND').asFloat))))
                                                           + sTempoMedio;
              TempoTotal := TempoTotal + qryAux.fieldByName('TOTAL_EM_SEGUNDOS').AsFloat;


              qryAux.Post;
              qryAux.next;
            end
            else
            begin
               if qryaux.RecordCount > strToInt(DBSpinEditQtdCidades.text)+1 then
               begin
                 qryAux.last;
                 qryAux.Delete;
               end
               else
                 qryAux.Next;
             end;
            contador := contador + 1;
          end;

          contaRegistro := 0;
          qryAux.Last;
          TotAtend := 0;
          while not qrygrafico.eof do
          begin
            if contaRegistro > DBSpinEditQtdCidades.Value + 1 then
            begin
              qryAux.Last;
              TotAtend := TotAtend + qryGrafico.fieldByName('CONTATEND').asFloat;
              percent := (TotAtend * 100) / TotalGeral;
              if qryAux.recordCount >= DBSpinEditQtdCidades.Value + 1 then
                qryAux.Delete;
            end;
            qrygrafico.next;
            contaRegistro := contaRegistro + 1;
          end;
          qryAux.Last;
          qryAux.Append;
          qryAux.fieldByName('CIDADES').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') '+'OUTROS';
          qryAux.fieldByName('CONTATEND').asFloat := TotAtend;
          qryAux.fieldByName('Legenda').asString := ' ('+FormatFloat('#,##0.00', percent)+'% de '+FloatToStr(TotalGeral)+') ' +
                                                      'OUTROS' + stringOfChar(' ', 35);
          qryAux.Post;
          dsGrafico.Dataset := qryAux;

       end;
//******************
// Daniel - Fim - 23612 - Início -----------------------------------------------
      if (ppTeeChart1.Chart.Series[0].Active=True) then begin
        ppTeeChart1.Chart.Series[0].DataSource          := ppDBPipeline1; { <-- the Table component }
        ppTeeChart1.Chart.Series[0].YValues.ValueSource := 'CONTATEND';   { <-- the Field for Bar Values }
        ppTeeChart1.Chart.Series[0].XLabelsSource       := 'Legenda';     { <-- the Field for Bar Labels }

        if (TotalGeral>0) then
          ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
      end;

      if (ppTeeChart1.Chart.Series[1].Active=True) then begin
        ppTeeChart1.Chart.Series[1].DataSource          := ppDBPipeline1;
        ppTeeChart1.Chart.Series[1].YValues.ValueSource :='CONTATEND';
        ppTeeChart1.Chart.Series[1].XLabelsSource       :='Legenda';

        if (TotalGeral>0) then
          ppLblTempoMedioTotal.Caption := ' Tempo Médio Total: '+TempoFormatado(round(TempoTotal/TotalTempoMedio));
      end;

    end;
// Daniel - Fim - 23612 - Fim --------------------------------------------------
//************************************

 end;
end;


procedure TfrmGrafAtend.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  try
    qryAux.Cancel;
    qryAux.Close;
    QRYaux2.Cancel;
    QRYaux2.Close;
    qrygrafico.Cancel;
    qrygrafico.Close;
    if dtmBaseDados.dbBaseDados.InTransaction then
      RollbackTransacao;
    FrmPreview.Close;
    FrmPreview.Release;
    frmGrafAtend.Release;
  except end;
end;

procedure TfrmGrafAtend.Totaliza;
begin
  TotalGeral := 0;
  TotalTempoMedio := 0;
  qryGrafico.First;
  while not qryGrafico.Eof do
  begin
    TotalGeral := TotalGeral + qryGrafico.FieldByName('CONTATEND').asFloat;

    //DAVID - Pendência 18425
    if qryGrafico.FieldByName('TOTAL_EM_SEGUNDOS').AsInteger > 0 then
      TotalTempoMedio := TotalTempoMedio + qryGrafico.FieldByName('CONTATEND').asFloat;

    qryGrafico.next;
  end;
  qryGrafico.First;
  ppLabel2.Caption := 'Total de Atendimentos: '+ FloatToStr(TotalGeral);
  if TotalTempoMedio = 0 then
    TotalTempoMedio := 1;
end;


function TfrmGrafAtend.TempoFormatado( iSegundos: integer ): string;
begin
  if rgrpExibir.ItemIndex = 0 then
    Result := IntToStr( iSegundos ) + ' s'
  else
    Result := SegundosParaHMS( iSegundos );
end;

end.

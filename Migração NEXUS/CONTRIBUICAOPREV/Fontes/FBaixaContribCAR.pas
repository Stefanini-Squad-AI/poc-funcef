// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : bbtnReceberClick, bbtnBaixarClickClick
Nº SOL.....: 253577-17744
KTN / PPM  : 1063636
Data       : 12/01/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - inadimplencia
-------------------------------------------------------------------------------}
// Autor(a)    : Jéssica Lana
// Data        : 23/03/2010
// Pendência   : SOL 128123 KINTANA 685922
// Descricao   : Atualização na baixa de documentos, para baixar os docs em
//               aberto ligados a contribuição individual "financeiro"
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana Nunes dos Santos
// Data        : 05/03/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   : Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : modificação de query
//  Data       : 04/05/2006
//  Pendencia  : 22153
//  Alteração  : Mudança de label de "Atrasada e não paga" para "Atrasada e já tratada".
// -------------------------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : bbtnReceberClick
//  Data       : 10/03/2005
//  Pendência  : 18418 / 18740
//  Descrição  : Alterado o order by da qry para:
//               ORDER BY HST.MESCOBRANCA DESC, HST.MESREFERENCIA
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 14.07.2004
//  Pendência  : 17201
//  Descrição  : Alterações na Baixa de Contribuicoes do Contas a Receber
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : BaixaContribCAR
//  Data       : 30.06.2004
//  Pendência  : 17112
//  Descrição  : Não impedir que continue se der erro em uma matricula
//               ATENÇÃO :  ALTEREI A ROTINA PARA NÃO FAZER MAIS O LOOP NA
//                          QRYCONTRIB. O LOOP  DEVE  SER  FEITO NA ROTINA
//                          CHAMADORA.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 31.03.2004
// Pendencia   : -----
// Alteração   : Inclusao dos campos de integracao contabil
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.03.2004
// Pendencia   : 16272
// Alteração   : Ordenar o grid por matricula e permitir ordem no click da coluna
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FBaixaContribCAR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery, Spin, Mask, wwdbedit, MontaSelect, TEdNum,
  wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, DBGrids;

type
  TfrmBaixaContribCAR = class(TfrmSairAjuda)
    GroupBox1: TGroupBox;
    chkParticipante: TCheckBox;
    chkPatrocinadora: TCheckBox;
    GroupBox2: TGroupBox;
    dtVencIni: TCMDateTimePicker;
    dtVencFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    Panel1: TPanel;
    dbgrdContrib: TwwDBGrid;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    sbtnSelParticipante: TSpeedButton;
    MontaSelectPart: TMontaSelect;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qryParticipante: TwwQuery;
    dbedParticipante: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    dsParticipante: TwwDataSource;
    bbtnLimparFiltro: TBitBtn;
    edTotalEsperado: TEditNum;
    edTotalRegistros: TEditNum;
    Label10: TLabel;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    updContabil: TUpdateSQL;
    memResult: TMemo;
    Panel2: TPanel;
    bbtnProcurar: TBitBtn;
    bbtnReceber: TBitBtn;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    bbtnVoltar: TBitBtn;
    qryBaixarDoc: TQuery;
    dsBaixarDoc: TDataSource;
    bbtnBaixar: TBitBtn;
    QryBaixar: TwwQuery;
    dsBaixar: TwwDataSource;
    GrdDocumentosBaixados: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnReceberClick(Sender: TObject);
    procedure chkParticipanteClick(Sender: TObject);
    procedure sbtnSelParticipanteClick(Sender: TObject);
    procedure bbtnLimparFiltroClick(Sender: TObject);
    procedure dbgrdContribTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnBaixarClickClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);

  private // Private declarations

    SAnoMesCob : STRING;
    procedure PreparaContribAReceber;
    function titularTemMaisDe3InadConsecutivas: Boolean;


  public  // Public declarations


  end;



var
  frmBaixaContribCAR: TfrmBaixaContribCAR;



implementation
{$R *.DFM}
uses
  DBaseDados, DAPrev, fAguarde, UContribuicaoPrev, UMensErro, usistema, UAdmPrev;




procedure TfrmBaixaContribCAR.PreparaContribAReceber;
var sSQL : string;
    rTotalEsperado   : double;
    iTotalRegistros  : longint;
begin

   sAnoMesCob  := Trim(spedAnoCob.Text)+'/';
   if cmbMesCob.ItemIndex <= 8
   then sAnoMesCob := sAnoMesCob+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   else sAnoMesCob := sAnoMesCob+IntToStr(cmbMesCob.ItemIndex+1);

   // Se nenhum filtro estiver preenchido avisar que pode demorar
   if (not chkParticipante.Checked) and (not chkPatrocinadora.Checked) and
      (Trim(dtVencIni.Text) = '')   and (Trim(dtVencFim.Text) = '')    and
      (Trim(cmbMesCob.Text) = '')
   then if MsgDlg(' A atualização destes dados pode demorar alguns minutos. Deseja continuar ? ',
                  'Confirmação',mtConfirmation, [mbYes, mbNo],0) = mrNo
        then Exit;


   sSQL := ' SELECT EL.MATRICULA,           P.NOME,                                       '+
           '        D.NODOCUMENTO,          D.NOSSONUMERO,          C.NOMERESUM,          '+
           '                                                                     '+
           '        HST.MESREFERENCIA,      HST.MESCOBRANCA,                              '+
           '        HST.DATAPREVISAORECE,   HST.VALORESPERADO,      HST.VALORRECEBIDO,    '+
           '        HST.SITRECEBIMENTO,     HST.NUMRECEBIMENTO,     HST.DATARECEBIMENTO,  '+
           '        HST.CODDOCUMENTOPREV,   HST.FLGDESCFOLHA,       HST.IDCONTRIBUICAO,   '+
           '        HST.IDPESSJUR,          HST.IDPLANOPREV,        HST.IDPESSOA,         '+
           '        HST.SEQPROPOSTA,        HST.FLGSITFUNDACAO,     HST.VALORESPERADO,    '+
           '        HST.DATACANCELAMENTO,   HST.DATAEMISSCOB,       HST.IDMOTIVO,         '+
           '        C.NOME AS NOMECONTRIB,  HST.FLGDEVOLUCAO,                             '+
           '        CP.CODCENTROCUSTOC,     CP.PLACONTAC,           CP.PLACONTADBANCO,    '+
           '        CP.PLACONTADEVOL,       CP.CODCCUSTODEVOL,      CP.CODCENTROCUSTOD,   '+
           '        CP.CODSUBCONTA,         CP.CODTIPRECDES,        CP.CODTIPDESEMBDEVOL, '+
           '        CP.CODCENTRORESPON,     CP.CODCENTRORESPON,     CP.UNIDNEGOC,         '+
           '        CP.IDPLANPREVCONTAB,    PP.INSCRICAONUMERO                            '+
           '        ,PA.NOME AS PATROCINADORA,                                            '+//Jéssica SOL128123
           '        D.STATUS                                                              '+//Jéssica SOL128123
           '        ,S.FLGINTERNO                                                              '+//Jéssica SOL128123
           ' FROM   PESSOA P, PATRO PT, ELEGPATRO EL, PARTPREVPLAN PP,           '+
           '        HSTCONTRIBPREV HST, CONTRIBUICAO C, DOCUMENTO D, CONTPREV CP '+
           '        ,PESSOA PA                                   '+ //Jássica SOL128123
           '        ,SITPART S '+ //Helio - SOL Nº 253577/17744 PPM Nº 1063636
           ' WHERE  (HST.MESCOBRANCA = '''+sAnoMesCob+''')                       '+
           ' AND    (HST.IDPESSOA         = P.IDPESSOA)                          '+
           ' AND    (PT.IDPESSOA          = HST.IDPESSJUR)                       '+
           ' AND    (PT.IDFUNDACAO        = '+IntToStr(iIdFundacao)+           ')'+
           ' AND    (HST.CODDOCUMENTOPREV = D.CODDOCUMENTO(+) )                  '+
           ' AND    (HST.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)                    '+
           ' AND    (HST.IDPLANOPREV      = CP.IDPLANOPREV)                      '+
           ' AND    (HST.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                   '+
           ' AND    ( (HST.VALORRECEBIDO  = 0) OR (HST.VALORRECEBIDO IS NULL) )  '+
           ' AND    (HST.FLGDESCFOLHA     = 0)                                   '+
           ' AND    (HST.CODDOCUMENTOPREV IS NOT NULL)                           '+
           ' AND    (HST.SITRECEBIMENTO   = ''1'') ' +
           ' AND    (PP.IDSITPART = S.IDSITPART(+)) '; //Helio - SOL Nº 253577/17744 PPM Nº 1063636

   if (chkParticipante.Checked) and (not chkPatrocinadora.Checked)
   then sSQL := sSQL+ ' AND ( (CP.FLGPAGADOR = ''C'') OR (CP.FLGPAGADOR = ''P'')  ) '
   else if (not chkParticipante.Checked) and (chkPatrocinadora.Checked)
        then sSQL := sSQL + ' AND (CP.FLGPAGADOR = ''E'' ) ';

   if Trim(dtVencIni.Text) <> ''
   then sSQL := sSQL + ' AND (HST.DATAPREVISAORECE >= TO_DATE('''+Trim(dtVencIni.Text)+''',''dd/mm/yyyy'') ) ';

   if Trim(dtVencFim.Text) <> ''
   then sSQL := sSQL + ' AND (HST.DATAPREVISAORECE <= TO_DATE('''+Trim(dtVencFim.Text)+''',''dd/mm/yyyy'') ) ';

   if (chkParticipante.Checked) and (Trim(dbedParticipante.Text) <> '')
   then begin
      sSQL := sSQL + ' AND (HST.IDPESSJUR   = '+qryParticipante.FieldByName('IdPessJur').AsString+')'+
                     ' AND (HST.IDPLANOPREV = '+qryParticipante.FieldByName('IdPlanoPrev').AsString+')'+
                     ' AND (HST.IDPESSOA    = '+qryParticipante.FieldByName('IdPessoa').AsString+')'+
                     ' AND (HST.SEQPROPOSTA = '+qryParticipante.FieldByName('SeqProposta').AsString+')';
 end;


   sSQL := sSQL + ' AND EL.IDPESSJUR(+)   = HST.IDPESSJUR     '+
                  ' AND EL.IDPESSOA(+)    = HST.IDPESSOA      '+
                  ' AND PP.IDPESSJUR(+)   = HST.IDPESSJUR     '+
                  ' AND PP.IDPLANOPREV(+) = HST.IDPLANOPREV   '+
                  ' AND PP.IDPESSOA(+)    = HST.IDPESSOA      '+
                  ' AND PP.SEQPROPOSTA(+) = HST.SEQPROPOSTA   '+
                  ' AND PA.IDPESSOA = PT.IDPESSOA             '+ //Jessica
                  ' ORDER BY EL.MATRICULA                     ';

   frmAguarde.Mostra('Verificando contribuições não recebidas ...');
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(sSQL);
   try
      qry.Open;
   except
      MsgDlg('Erro ao consultar contribuições a receber.','Erro',mtError,[mbOk, mbHelp],0);
   end;

   dbgrdContrib.RefreshDisplay;

   rTotalEsperado  := 0;
   iTotalRegistros := 0;
   qry.DisableControls;
   qry.First;
   while not qry.Eof do
   begin
      inc(iTotalRegistros);
      rTotalEsperado := rTotalEsperado + qry.FieldByName('ValorEsperado').AsFloat;
      qry.Next;
   end;
   qry.First;
   qry.EnableControls;

   edTotalEsperado.Text  := FloatToStr(rTotalEsperado);
   edTotalRegistros.Text := IntToStr(iTotalRegistros);

   frmAguarde.Apaga;

end; // PreparaContribAReceber

procedure TfrmBaixaContribCAR.FormShow(Sender: TObject);

var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  DecodeDate(date, AYear, AMonth, ADay);

  chkParticipante.Checked     := False;
  chkPatrocinadora.Checked    := False;
  dtVencIni.Text              := '';
  dtVencFim.Text              := '';
  cmbMesCob.Text              := '';
  spedAnoCob.Text             := IntToStr(AYear);
  sbtnSelParticipante.Visible := False;
  bbtnLimparFiltroClick(Sender);
  bbtnSalvar.Visible := False;
  bbtnVoltar.Visible := False;
  dbgrdContrib.BringToFront;
  bbtnReceber.Enabled := False;
end;

procedure TfrmBaixaContribCAR.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  PreparaContribAReceber;
  GrdDocumentosBaixados.SendToBack;//jessica
  dbgrdContrib.BringToFront;
  bbtnReceber.Enabled := True;
end;

procedure TfrmBaixaContribCAR.bbtnReceberClick(Sender: TObject);
var bOk      : boolean;
    sMsgErro : string;
    bAlgumErro : boolean;
    i          : integer;
    iTotal     : integer;
    bAviso     : boolean;
    dValorPago : Double;
    sDtUltimaBaixa : string;        // edilaine - SOL 253577-17744 / PPM 1063636
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  memResult.Lines.Clear;
  memResult.Lines.Add('=================================================================================== ');
  memResult.Lines.Add('RECEBIMENTO DE CONTRIBUIÇÕES COBRADAS VIA BANCO - DATA : '+DateToStr(date)+' LISTA DE RESULTADOS ');
  memResult.Lines.Add('MÊS DE COBRANÇA : '+Trim(sAnoMesCob));
  memResult.Lines.Add('=================================================================================== ');
  memResult.Lines.Add(' ');
  bAlgumErro := False;
  i          := 0;
  iTotal     := qry.RecordCount;
  bAviso     := False;

  dValorPago := 0;

  qry.First;
  while not qry.Eof do
  begin
     inc(i);
     frmAguarde.Mostra('Processando '+IntToStr(i)+' de '+IntToStr(iTotal)+'...');
     Application.ProcessMessages;
     bOk := BaixaContribCAR( dtmAPrev.qryAux,
                             qry.FieldByName('MESCOBRANCA').AsString,
                             qry.FieldByName('MESREFERENCIA').AsString,
                             qry.FieldByName('NUMRECEBIMENTO').AsInteger,
                             qry.FieldByName('SITRECEBIMENTO').AsInteger,
                             qry.FieldByName('CODDOCUMENTOPREV').AsInteger,
                             qry.FieldByName('IDMOTIVO').AsInteger,
                             qry.FieldByName('VALORESPERADO').AsFloat,
                             sMsgErro,
                             sDtUltimaBaixa,       // edilaine - SOL 253577-17744 / PPM 1063636
                             qry.FieldByName('NOMERESUM').AsString);
     if not bOk
     then begin
        bAlgumErro := True;
        memResult.Lines.Add('[ ERRO ] - MATRICULA : '+qry.FieldByName('MATRICULA').AsString+' : '+sMsgErro);
     end
     else begin
        // A rotina irá retornar mensagem de aviso com Result = True
        if Trim(sMsgErro) <> ''
        then begin
           memResult.Lines.Add('MATRICULA : '+qry.FieldByName('MATRICULA').AsString);
           memResult.Lines.Add(sMsgErro);
        end;
        bAviso := True;
     end;
     qry.Next;
  end;

  // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
  if(titularTemMaisDe3InadConsecutivas) then
  begin
    try
       // ajusta data de retorno da inadimplencia
       bOk := AjustaEventoInadimplencia(dtmAPrev.qryAux,
                                       qry.FieldByName('IdPessoa').AsInteger,
                                       sMsgErro,
                                       sDtUltimaBaixa);

       if not bOk then
       begin
          bAlgumErro := True;
          memResult.Lines.Add('[ ERRO ] - MATRICULA : '+qry.FieldByName('MATRICULA').AsString+' : '+sMsgErro);
       end
       else if Trim(sMsgErro) <> '' then
       begin
          bAviso := True;
          memResult.Lines.Add('MATRICULA : '+qry.FieldByName('MATRICULA').AsString);
          memResult.Lines.Add(sMsgErro);
       end;
    except
       bAlgumErro := True;
       memResult.Lines.Add('[ ERRO ] - MATRICULA : '+qry.FieldByName('MATRICULA').AsString+' : Ocorreu um erro na atualização da inadimplência');
    end;
  end;
  // edilaine - SOL 253577-17744 / PPM 1063636 - fim


  frmAguarde.Apaga;
  Try
     If Not Sistema.GravaLogOperacoes(Self.Caption)
     Then  raise exception.Create('Erro ao gravar Log.')
  Except
  End;
  dtmBaseDados.dbBaseDados.Commit;
  if bAlgumErro
  then begin
     MsgDlg('Baixa das contribuições efetuada com problemas. Verifique a lista de resultado.','Informação',mtInformation,[mbOk],0);
     memResult.Lines.Add('=================================================================================== ');
     memResult.Lines.Add('RECEBIMENTO DE CONTRIBUIÇÕES COBRADAS VIA BANCO EFETUADO COM PROBLEMAS. ');
     memResult.Lines.Add('=================================================================================== ');
  end
  else
  begin
     if bAviso then
     begin
       MsgDlg('Baixa das contribuições efetuada com sucesso.'+#13#10+
         'Existem mensagens que devem ser verificadas no LOG.','Informação',mtInformation,[mbOk],0);
       memResult.Lines.Add('=================================================================================== ');
       memResult.Lines.Add('RECEBIMENTO DE CONTRIBUIÇÕES COBRADAS VIA BANCO EFETUADO COM SUCESSO. ');
       memResult.Lines.Add('ALGUMAS MENSAGENS DE OBSERVAÇÃO FORAM EMITIDAS E DEVEM SER VERIFICADAS. ');
       memResult.Lines.Add('=================================================================================== ');
     end
     else
     begin
       MsgDlg('Baixa das contribuições efetuada com sucesso.','Informação',mtInformation,[mbOk],0);
       memResult.Lines.Add('=================================================================================== ');
       memResult.Lines.Add('RECEBIMENTO DE CONTRIBUIÇÕES COBRADAS VIA BANCO EFETUADO COM SUCESSO. ');
       memResult.Lines.Add('=================================================================================== ');
    end;
  end;

  dbgrdContrib.SendToBack;
  bbtnSalvar.Visible := True;
  bbtnVoltar.Visible := True;
end;

procedure TfrmBaixaContribCAR.chkParticipanteClick(Sender: TObject);
begin
  inherited;
  sbtnSelParticipante.Visible := (chkParticipante.Checked);
end;

procedure TfrmBaixaContribCAR.sbtnSelParticipanteClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     qryParticipante.Close;
     qryParticipante.ParamByName('IdPessJur').AsInteger   := StrToInt(MontaSelectPart.ValoresChave[0]);
     qryParticipante.ParamByName('IdPlanoPrev').AsInteger := StrToInt(MontaSelectPart.ValoresChave[1]);
     qryParticipante.ParamByName('IdPessoa').AsInteger    := StrToInt(MontaSelectPart.ValoresChave[2]);
     qryParticipante.ParamByName('SeqProposta').AsInteger := StrToInt(MontaSelectPart.ValoresChave[3]);
     qryParticipante.Open;
  end;
end;



procedure TfrmBaixaContribCAR.bbtnLimparFiltroClick(Sender: TObject);
begin
  inherited;
  qryParticipante.Close;
  qryParticipante.ParamByName('IdPessJur').AsInteger   := -1;
  qryParticipante.ParamByName('IdPlanoPrev').AsInteger := -1;
  qryParticipante.ParamByName('IdPessoa').AsInteger    := -1;
  qryParticipante.ParamByName('SeqProposta').AsInteger := -1;
  qryParticipante.Open;
end;



procedure TfrmBaixaContribCAR.dbgrdContribTitleButtonClick(Sender: TObject;
  AFieldName: String);
var sSQL : string;
    i    : integer;
begin
  inherited;

  sSQL := qry.SQL.Text;
  i    := Pos('ORDER',sSQL);
  sSQL := Copy(sSQL,1,i-1);
  sSQL := sSQL+' ORDER BY '+AFieldName;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSQL);
  qry.Open;
end;



procedure TfrmBaixaContribCAR.bbtnSalvarClick(Sender: TObject);
begin
  inherited;

  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmBaixaContribCAR.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  dbgrdContrib.BringToFront;
  bbtnVoltar.Visible := False;
end;



procedure TfrmBaixaContribCAR.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  bbtnBaixar.Caption := 'Baixar DOC'+chr(13)+'Abertos';
end;

procedure TfrmBaixaContribCAR.bbtnBaixarClickClick(Sender: TObject);
var
  QryDocAbertos : TwwQuery;
  QryAux        : TwwQuery;
  sSQL          : String;
  sMsgErro      : String;
  sDtUltimaBaixa : string;       // edilaine - SOL 253577-17744 / PPM 1063636
begin
  inherited;

  if not dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.StartTransaction;

  try
    sAnoMesCob  := Trim(spedAnoCob.Text)+'/';
    if cmbMesCob.ItemIndex <= 8
    then sAnoMesCob := sAnoMesCob+'0'+IntToStr(cmbMesCob.ItemIndex+1)
    else sAnoMesCob := sAnoMesCob+IntToStr(cmbMesCob.ItemIndex+1);


    sSQL:='';
    GrdDocumentosBaixados.SendToBack;

    QryDocAbertos := TwwQuery.Create(Application);
    QryDocAbertos.DataBaseName := 'BaseDados';

    QryAux := TwwQuery.Create(Application);
    QryAux.DataBaseName := 'BaseDados';


    QryDocAbertos.Close;
    QryDocAbertos.SQL.Clear;

    frmAguarde.Mostra('Buscando Documentos Baixados no Contas a Receber...');

    QryDocAbertos.SQL.Add('SELECT HST.IDPESSOA,HST.IDPLANOPREV,HST.IDPESSJUR,HST.MESCOBRANCA,HST.MESREFERENCIA,HST.NUMRECEBIMENTO,HST.SITRECEBIMENTO,');
    QryDocAbertos.SQL.Add('HST.CODDOCUMENTOPREV,HST.IDMOTIVO,HST.VALORESPERADO,C.NOMERESUM,HST.FLGSITFUNDACAO');
    QryDocAbertos.SQL.Add('FROM HSTCONTRIBPREV HST, CONTRIBUICAO C');

    if Trim(sAnoMesCob)<>'' then begin
      QryDocAbertos.SQL.Add('WHERE HST.MESCOBRANCA ='+ QuotedStr(sAnoMesCob));
    end else begin
      QryDocAbertos.SQL.Add('WHERE HST.MESCOBRANCA = (SELECT TO_CHAR(SYSDATE,''YYYY/MM'') FROM dual)');
    end;

    QryDocAbertos.SQL.Add('AND HST.IDPESSJUR IN (1, 91008)');
    QryDocAbertos.SQL.Add('AND HST.SITRECEBIMENTO = 1');
    QryDocAbertos.SQL.Add('AND HST.CODDOCUMENTOPREV IN');
    QryDocAbertos.SQL.Add('(SELECT CODDOCUMENTO FROM LANCTODOCUM L WHERE L.OPERACAO = 5)');
    QryDocAbertos.SQL.Add('AND HST.IDCONTRIBUICAO = C.IDCONTRIBUICAO');
    QryDocAbertos.Open;

    frmAguarde.Apaga;

    if QryDocAbertos.isEmpty then begin
      MsgDlg(' Não existem atualizações a serem feitas.','Confirmação',mtConfirmation,[mbOK],0);
      GrdDocumentosBaixados.SendToBack;
      exit;
    end;

    frmAguarde.Mostra('Baixando Documento(s) Aberto(s).');

    QryDocAbertos.first;
    While Not QryDocAbertos.Eof Do begin
      BaixaContribCAR( dtmAPrev.qryAux,
                               QryDocAbertos.FieldByName('MESCOBRANCA').AsString,
                               QryDocAbertos.FieldByName('MESREFERENCIA').AsString,
                               QryDocAbertos.FieldByName('NUMRECEBIMENTO').AsInteger,
                               QryDocAbertos.FieldByName('SITRECEBIMENTO').AsInteger,
                               QryDocAbertos.FieldByName('CODDOCUMENTOPREV').AsInteger,
                               QryDocAbertos.FieldByName('IDMOTIVO').AsInteger,
                               QryDocAbertos.FieldByName('VALORESPERADO').AsFloat,
                               sMsgErro,
                               sDtUltimaBaixa,       // edilaine - SOL 253577-17744 / PPM 1063636
                               QryDocAbertos.FieldByName('NOMERESUM').AsString);


     QryAux.Close;
     QryAux.SQL.Clear;

     QryAux.SQL.ADD(' SELECT (SELECT MATRICULA FROM elegpatro WHERE idpessoa = ppp.idpessoa)  AS MATRICULA, ');
     QryAux.SQL.ADD('        (SELECT nome FROM pessoa WHERE idpessoa = ppp.idpessoa) AS PARTICIPANTE,       ');
     QryAux.SQL.ADD('        (SELECT Nome FROM pessoa WHERE idpessoa=ppp.idpessjur)  AS PATROCINADORA,      ');
     QryAux.SQL.ADD('        ppp.idpessjur,ppp.idplanoprev,ppp.inscricaonumero                              ');
     QryAux.SQL.ADD(' FROM PARTPREVPLAN ppp                                                                 ');
     QryAux.SQL.ADD('        WHERE ppp.IDPESSJUR ='+QryDocAbertos.FieldByname('IDPESSJUR').asString);
     QryAux.SQL.ADD('        AND ppp.IDPESSOA    ='+QryDocAbertos.FieldByname('IDPESSOA').asString);
     QryAux.SQL.ADD('        AND ppp.IDPLANOPREV ='+QryDocAbertos.FieldByname('IDPLANOPREV').asString);

     QryAux.open;

     sSQL := sSQL +' SELECT   '+
             QuotedStr(QryAux.FieldByname('MATRICULA').asString)      +        ' AS MATRICULA,      '+
             QuotedStr(QryAux.FieldByname('PARTICIPANTE').asString)   +        ' AS PARTICIPANTE,   '+
             QuotedStr(QryDocAbertos.FieldByname('FLGSITFUNDACAO').asString) + ' AS SITFUND, '+
             QuotedStr(QryAux.FieldByname('PATROCINADORA').asString)  +        ' AS PATROCINADORA,  '+
             QuotedStr(QryAux.FieldByname('IDPLANOPREV').asString)    +        ' AS IDPLANOPREV,    '+
             QuotedStr(QryAux.FieldByname('INSCRICAONUMERO').asString)+        ' AS INSCRICAONUMERO '+
             ' FROM DUAL UNION';

      QryDocAbertos.Next;
    end;

    if sSQL <> '' Then begin
      sSQL := Copy(sSQL,1,length(sSQL)-5);
      qryBaixar.Close;
      qryBaixar.SQL.Clear;
      qryBaixar.SQL.Add(sSQL);
      qryBaixar.Open;
    end;

    // edilaine - SOL 253577-17744 / PPM 1063636 - inicio
    if sDtUltimaBaixa <> emptyStr then
    begin
      try
         // ajusta data de retorno da inadimplencia
         if not AjustaEventoInadimplencia(dtmAPrev.qryAux,
                                          qry.FieldByName('IdPessoa').AsInteger,
                                          sMsgErro,
                                          sDtUltimaBaixa) then
         begin
           MsgDlg('Ocorreu um erro na atualização da inadimplência['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
         end;
      except
         MsgDlg('Ocorreu um erro na atualização da inadimplência['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
      end;
    end;
    // edilaine - SOL 253577-17744 / PPM 1063636 - fim


    FreeAndNil(QryDocAbertos);
    FreeAndNil(QryAux);
    GrdDocumentosBaixados.BringToFront;
    frmAguarde.Apaga;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
      
  except
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;
  end;
end;

//end;
procedure TfrmBaixaContribCAR.qryAfterOpen(DataSet: TDataSet);
begin
//  inherited;
   
end; 

//Helio - SOL Nº 253577/17744 PPM Nº 1063636
function TfrmBaixaContribCAR.titularTemMaisDe3InadConsecutivas : Boolean;
var
     qryTemp : TwwQuery;
begin
       Result := False;

       qryTemp := TwwQuery.Create(Application);
       qryTemp.DatabaseName := dtmBaseDados.dbBaseDados.DataBaseName;

       try
         qryTemp.SQL.Text := 'SELECT DISTINCT' + #13#10 +
                              '      DE.MATRICULA,' + #13#10 +
                              '      P.NOME,' + #13#10 +
                              '      PL.NOME PLANO,' + #13#10 +
                              '      P1.NOME PATRO,' + #13#10 +
                              '      PL.IDPLANOPREV,' + #13#10 +
                              '      P1.IDPESSOA AS IDPATRO,' + #13#10 +
                              '      P1.NOME AS IDPATRO,' + #13#10 +
                              '      S.DESCRICAO,' + #13#10 +
                              '      DE.IDTITULAR,' + #13#10 +
                              '      DE.IDPESSOA' + #13#10 +
                              ' FROM' + #13#10 +
                              '(SELECT Z.IDPESSOA,' + #13#10 +
                              '       Z.MESREFERENCIA,' + #13#10 +
                              '       Z.QTD_NAOPAGA,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA, 0, ''Paga'', ''Aberta'') AS STATUS_MES_ATUAL,' + #13#10 +
                              '       DECODE(Z.QTD_NAOPAGA,' + #13#10 +
                              '              0,' + #13#10 +
                              '              NULL,' + #13#10 +
                              '              DENSE_RANK() OVER(PARTITION BY Z.GRUPO ORDER BY Z.IDPESSOA, Z.IDPLANOPREV, Z.IDPESSJUR, Z.MESREFERENCIA)) AS CONSECUTIVAS,' + #13#10 +
                              '        Z.IDPLANOPREV,' + #13#10 +
                              '        Z.IDPESSJUR' + #13#10 +
                              '  FROM (SELECT Y.*, MAX(Y.MUDOU) OVER(ORDER BY Y.IDPESSOA, Y.IDPLANOPREV, Y.IDPESSJUR, Y.MESREFERENCIA, Y.SEQ) AS GRUPO' + #13#10 +
                              '          FROM (SELECT X.*,' + #13#10 +
                              '                       CASE' + #13#10 +
                              '                         WHEN (X.IDPESSOA <> LAG(X.IDPESSOA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPLANOPREV <> LAG(X.IDPLANOPREV) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN (X.IDPESSJUR <> LAG(X.IDPESSJUR) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ)) THEN' + #13#10 +
                              '                                  SEQ' + #13#10 +
                              '                         WHEN'  + #13#10 +
                              '                           QTD_NAOPAGA = LAG(QTD_NAOPAGA) OVER(ORDER BY X.IDPESSOA, X.IDPLANOPREV, X.IDPESSJUR, X.MESREFERENCIA, X.SEQ) THEN' + #13#10 +
                              '                          NULL' + #13#10 +
                              '                         ELSE' + #13#10 +
                              //'                          TO_CHAR( TO_DATE(X.MESREFERENCIA, ''YYYY/MM''), ''YYYYMM'')||X.IDPESSOA||X.IDPLANOPREV||X.IDPESSJUR' + #13#10 +
                              '                          SEQ--X.IDPLANOPREV||X.MESREFERENCIA||X.IDPESSOA||X.IDPESSJUR' + #13#10 +
                              '                       END AS MUDOU' + #13#10 +
                              '                  FROM (SELECT H.IDPESSOA,' + #13#10 +
                              '                               H.MESREFERENCIA,' + #13#10 +
                              '                               DECODE(SUM(DECODE(H.SITRECEBIMENTO,' + #13#10 +
                              '                                                 0,' + #13#10 +
                              '                                                 1, -- /*''Nao Enviada''*/,' + #13#10 +
                              '                                                 1,' + #13#10 +
                              '                                                 1, -- ''Enviada e não recebida'',' + #13#10 +
                              '                                                 --3,' + #13#10 +
                              '                                                 --1, -- ''Recebida com divergência (NT)'',' + #13#10 +
                              '                                                 --4,' + #13#10 +
                              '                                                 --1, -- ''Atrasada e ja tratada'',' + #13#10 +
                              '                                                 --6,' + #13#10 +
                              '                                                 --1, -- ''Divergência enviada e não recebida'',' + #13#10 +
                              '                                                 --7,' + #13#10 +
                              '                                                 --1, -- ''Financiada ou Renegociada ''' + #13#10 +
                              '                                                 0)),' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      0,' + #13#10 +
                              '                                      1) AS QTD_NAOPAGA,' + #13#10 +
                              '                               RANK() OVER(ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA) AS SEQ,' + #13#10 +
                              '                               H.IDPLANOPREV,' + #13#10 +
                              '                               H.IDPESSJUR' + #13#10 +
                              '                          FROM' + #13#10 +
                              '                               HSTCONTRIBPREV H' + #13#10 +
                              '                               JOIN DEPENTIT DE' + #13#10 +
                              '                                 ON DE.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                               JOIN PARTPREVPLAN PP' + #13#10 +
                              '                                 ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              '                                AND PP.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                AND PP.IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                JOIN SITPART S' + #13#10 +
                              '                                  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              '                                 --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '                         WHERE H.IDPESSOA = ' + qry.FieldByName('IdPessoa').AsString + #13#10+
                              '                           AND S.FLGINTERNO = ' + QuotedStr(qry.FieldByName('FLGINTERNO').AsString) + #13#10+
                              '                           AND H.IDPLANOPREV = ' + qry.FieldByName('IDPLANOPREV').AsString + #13#10+
                              '                           AND H.IDPESSJUR = ' + qry.FieldByName('IDPESSJUR').AsString + #13#10+
                              '                               AND H.FLGDEVOLUCAO = 0' + #13#10 +
                              '                               AND (S.IDSITPART = 10 OR S.FLGINTERNO NOT IN (''CA''))' + #13#10 +
                              '                               AND NOT EXISTS(SELECT 1 FROM EVENTOSPREV EVNT' + #13#10 +
                              '                                WHERE IDPESSJUR = H.IDPESSJUR' + #13#10 +
                              '                                      AND EVNT.IDPLANOPREV = H.IDPLANOPREV' + #13#10 +
                              '                                      AND EVNT.IDPESSOA = H.IDPESSOA' + #13#10 +
                              '                                      AND EVNT.SEQPROPOSTA = H.SEQPROPOSTA' + #13#10 +
                              '                                      AND EVNT.DATAVOLTA IS NOT NULL' + #13#10 +
                              '                                      AND EVNT.IDEVENTOGERADOR = 274)' + #13#10 +
                              '                         GROUP BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ORDER BY H.IDPESSOA, H.IDPLANOPREV, H.IDPESSJUR, H.MESREFERENCIA' + #13#10 +
                              '                         ) X) Y) Z) PARC' + #13#10 +
                              'INNER JOIN DEPENTIT DE' + #13#10 +
                              '   ON DE.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PESSOA P' + #13#10 +
                              '  ON P.IDPESSOA = PARC.IDPESSOA' + #13#10 +
                              'INNER JOIN PLANPREV PL' + #13#10 +
                              '  ON PL.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              'INNER JOIN PESSOA P1' + #13#10 +
                              '  ON P1.IDPESSOA = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN PARTPREVPLAN PP' + #13#10 +
                              '  ON PP.IDPESSOA = DE.IDTITULAR' + #13#10 +
                              ' AND PP.IDPLANOPREV = PARC.IDPLANOPREV' + #13#10 +
                              ' AND PP.IDPESSJUR = PARC.IDPESSJUR' + #13#10 +
                              'INNER JOIN SITPART S' + #13#10 +
                              '  ON S.IDSITPART = PP.IDSITPART' + #13#10 +
                              ' --AND S.FLGINTERNO NOT IN (''CA'')' + #13#10 +
                              '  WHERE PARC.CONSECUTIVAS >= 3';


         qryTemp.Open;

         if Not qryTemp.IsEmpty then
             Result := true;
       finally
         qryTemp.Close;
         FreeAndNil(qryTemp);
       end;
end;

end.

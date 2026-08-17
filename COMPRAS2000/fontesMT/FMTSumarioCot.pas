unit FMTSumarioCot;
{ ------------------------------------------------------------------------------
Data      : 02.10.2006
Autor     : Antonio Marcos (amf)
Pendência : 22504
Descrição : Alterei a  propriedade DataPipeLine do componente ppOC para apontar
            para o componente bdeOC do DRelCompras.
--------------------------------------------------------------------------------
Data      : 20.09.2006
Autor     : Antonio Marcos (amf)
Pendência : 23138
Descrição : Trata o status do processo para evitar problemas na quantidade de Ocs
            geradas. As Ocs geradas, quando estão integradas com o sistema orçamentário,
            estão gerando mais compromissos que deveriam, afetando assim, o saldo
            da reserva orçamentária.
--------------------------------------------------------------------------------
Rotina    : PreparaPPOC
Data      : 20.07.2006
Autor     : Antonio Marcos (amf)
Pendência : 22504
Descrição : Foi inserida localmente a rotina que carrega a PPOC pois, estava em
            conflito com o relatório de Ordem de Compra (do menu de relatórios).
            A solução foi assim implementada devido ao caráter de urgência da
            situação e a complexidade da rotina original.
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db,
  Wwdatsrc,uCtrlCotacao, DBClient, uCMClientDataSet, TB97Tlwn,ppForms, ppPrvDlg,
  uCmSqlParams, ComCtrls, wwriched, DBTables, Wwquery, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, ppCtrls, ppRegion, ppReport, ppSubRpt, ppBands,
  ppMemo, ppClass, ppVar, ppStrtch, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, Mask;

type
  TfrmMTSumarioCot = class(TfrmSairAjuda)
    plnTitulo: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    LbProc: TLabel;
    BtnSelProc: TSpeedButton;
    lbStatus: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolbarSep972: TToolbarSep97;
    btnGeraOC: TBitBtn;
    btnConfSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    grdArt: TwwDBGrid;
    Splitter1: TSplitter;
    GrdCotacao: TwwDBGrid;
    MontaSelect: TMontaSelect;
    dsList: TwwDataSource;
    dsSumario: TwwDataSource;
    cdsList: TCMClientDataSet;
    cdsSumario: TCMClientDataSet;      
    spRAD: TCMSqlParams;
    cdsRAD: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    Panel4: TPanel;
    lblobs: TLabel;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    Label5: TLabel;
    sqlOc: TCMSqlParams;
    cdsOc: TCMClientDataSet;
    dsOc: TwwDataSource;
    qryOC: TwwQuery;
    qryOCRAZAOSOCIAL: TStringField;
    qryOCNOME: TStringField;
    qryOCENDERECO: TStringField;
    qryOCCOMPLEMENTO: TStringField;
    qryOCBAIRRO: TStringField;
    qryOCCEP: TStringField;
    qryOCCODESTADO: TStringField;
    qryOCEMAIL: TStringField;
    qryOCCIDADE: TStringField;
    qryOCTELEFONE: TStringField;
    qryOCDDD: TStringField;
    qryOCNUMOC: TFloatField;
    qryOCIDFORCLI: TFloatField;
    qryOCOCATENDIDA: TStringField;
    qryOCFLGIMPRESSA: TStringField;
    qryOCFLGCOMSEMOC: TStringField;
    qryOCFLGCOMSEMCOT: TStringField;
    qryOCOBSOC: TStringField;
    qryOCDATAOC: TDateTimeField;
    qryOCCODARTIGO: TStringField;
    qryOCVALORUN: TFloatField;
    qryOCQTDEENTREGA: TFloatField;
    qryOCDATAENTREGA: TDateTimeField;
    qryOCPRAZOENTREGA: TFloatField;
    qryOCTOTIMP: TFloatField;
    qryOCTOTITEM: TFloatField;
    qryOCVALTOTITEM: TFloatField;
    qryOCTOTOC: TFloatField;
    qryOCNUMDOCUMENTO: TStringField;
    qryOCCODMEDIDA: TStringField;
    qryOCDESCRCOMPL: TMemoField;
    qryOCOBSITEMOC: TStringField;
    qryOCCONTATO: TStringField;
    qryOCFRETE: TStringField;
    qryOCDESCRICAO: TMemoField;
    dsOC_X: TwwDataSource;
    bdeOC: TppBDEPipeline;
    bdeOCppField1: TppField;
    bdeOCppField2: TppField;
    bdeOCppField3: TppField;
    bdeOCppField4: TppField;
    bdeOCppField5: TppField;
    bdeOCppField6: TppField;
    bdeOCppField7: TppField;
    bdeOCppField8: TppField;
    bdeOCppField9: TppField;
    bdeOCppField10: TppField;
    bdeOCppField11: TppField;
    bdeOCppField12: TppField;
    bdeOCppField13: TppField;
    bdeOCppField14: TppField;
    bdeOCppField15: TppField;
    bdeOCppField16: TppField;
    bdeOCppField17: TppField;
    bdeOCppField18: TppField;
    ppOC: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppOCDBText11: TppDBText;
    ppOCDBText13: TppDBText;
    ppOCDBText15: TppDBText;
    ppOCDBText16: TppDBText;
    ppOCDBText17: TppDBText;
    ppOCDBText18: TppDBText;
    ppOCLabel16: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppFooterBand4: TppFooterBand;
    ppLine6: TppLine;
    ppLabel6: TppLabel;
    ppReport1Line8: TppLine;
    ppRepLbl1: TppLabel;
    ppReport1Line9: TppLine;
    ppRepLbl2: TppLabel;
    ppReport1Line10: TppLine;
    ppRepLbl3: TppLabel;
    ppCalc6: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLine4: TppLine;
    ppOCLabel1: TppLabel;
    ppOCShape1: TppShape;
    ppOCShape2: TppShape;
    ppOCLine1: TppLine;
    ppOCLabel2: TppLabel;
    ppOCLabel3: TppLabel;
    ppOCLabel4: TppLabel;
    ppOCDBText2: TppDBText;
    ppOCDBText3: TppDBText;
    ppOCDBText4: TppDBText;
    ppOCDBText5: TppDBText;
    ppOCDBText6: TppDBText;
    ppOCDBText7: TppDBText;
    ppOCLabel7: TppLabel;
    ppOCDBText8: TppDBText;
    ppOCLabel8: TppLabel;
    ppOCDBText9: TppDBText;
    ppOCLabel9: TppLabel;
    ppOCDBText10: TppDBText;
    ppOCLabel10: TppLabel;
    ppOCLabel11: TppLabel;
    ppOCLabel12: TppLabel;
    ppOCLabel13: TppLabel;
    ppOCLabel14: TppLabel;
    ppOCLabel15: TppLabel;
    ppReport1Label23: TppLabel;
    ppReport1Label21: TppLabel;
    ppMemFat: TppMemo;
    ppOCDBText14: TppDBText;
    ppOCLabel17: TppLabel;
    LbEndEnt: TppLabel;
    LbCompEnt: TppLabel;
    LbBairroEnt: TppLabel;
    LbCidadeEnt: TppLabel;
    LbUFEnt: TppLabel;
    LbCepEnt: TppLabel;
    LbNumDocEnt: TppLabel;
    LbEndCob: TppLabel;
    LbCompCob: TppLabel;
    LbCidadeCob: TppLabel;
    LbCepCob: TppLabel;
    LbBairroCob: TppLabel;
    LbUFCob: TppLabel;
    LbNumDocCob: TppLabel;
    ppOCDBText21: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppOCDBText1: TppDBText;
    ppOCLabel5: TppLabel;
    ppOCLabel6: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppOCSubReport1: TppSubReport;
    ppOCAgreg: TppChildReport;
    ppOCAgregHeaderBand1: TppHeaderBand;
    ppOCAgregLine1: TppLine;
    ppOCAgregLabel2: TppLabel;
    ppOCAgregLabel3: TppLabel;
    ppOCAgregLabel1: TppLabel;
    ppOCAgregDetailBand1: TppDetailBand;
    ppOCAgregDBText1: TppDBText;
    ppOCAgregDBText2: TppDBText;
    ppOCAgregDBText3: TppDBText;
    RgSumOC: TppRegion;
    ppOCLabel21: TppLabel;
    LbCondPag: TppLabel;
    ppOCLabel19: TppLabel;
    LbPrazoPag: TppLabel;
    ppOCLabel23: TppLabel;
    ppOCLabel22: TppLabel;
    ppOCLabel24: TppLabel;
    ppOCLabel25: TppLabel;
    ppOCDBCalc1: TppDBCalc;
    ppOCDBText19: TppDBText;
    lbTotGeralOC: TppDBText;
    hhghgfhfg: TppDBText;
    ppOCLine5: TppLine;
    ppOCLine3: TppLine;
    ppOCLine2: TppLine;
    ppOCLine4: TppLine;
    LbTotOC: TppLabel;
    LbValTot1: TppLabel;
    LbValTot2: TppLabel;
    memObsOC: TppMemo;
    ppParameterList2: TppParameterList;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelProcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsListDataChange(Sender: TObject; Field: TField);
    procedure GrdCotacaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormShow(Sender: TObject);
    procedure GrdCotacaoDblClick(Sender: TObject);
    procedure btnConfSelClick(Sender: TObject);
    procedure btnGeraOCClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PreparappOC(iOCIni, iOCFim: extended);
  private
    { Private declarations }
    Cotacao        : TCtrlCotacao;
    bVerifStatus   : Boolean;
    //
    Procedure Sel( CodProcesso : LongInt );
    Function  PedeObsJust(cTipo : Char; sCompl : String ) : String;
    Procedure ImpOC( NumI,NumF : Double);
  public
    sMem   : String;
    iFrete : Byte;
  end;

var
  frmMTSumarioCot: TfrmMTSumarioCot;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, Math,FMtJustif,
     uModulo,dBaseDados,
     FParamImpOC, DRelCompras, DCompras;


procedure TfrmMTSumarioCot.FormCreate(Sender: TObject);
begin
  inherited;

  if Modulo.sFormSumario = 'N' then
  begin
    Label5.Visible := true;
    lblobs.Visible := true;
    wwDBRichEdit1.visible := true;
    wwDBRichEdit2.visible := true;
  end
  else begin
    Label5.Visible := false;
    lblobs.Visible := false;
    wwDBRichEdit1.visible := false;
    wwDBRichEdit2.visible := false;
  end;

  Cotacao := TCtrlCotacao.Create;
  Cotacao.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Cotacao.cdsSumario := cdsSumario;
  //
  bVerifStatus        := False;
  lbStatus.Visible    := False;
  btnGeraOC.Visible   := Modulo.sFormSumario = 'S';
  btnConfSel.Visible  := Modulo.sFormSumario = 'S';
  GrdCotacao.ShowHint := Modulo.sFormSumario = 'S';
  //
  If Modulo.sFormSumario = 'S' Then
     Begin
        MontaSelect.Filtro.Add('PROCESSO.IDCOMPRADOR ='+IntToStr(Sistema.IdUsuario));
        MontaSelect.Filtro.Add('PROCESSO.STATUS  IN (''C'',''S'',''O'')');
     End;
  //
  LbProc.Caption := '';
  Sel( -1 );
end;

procedure TfrmMTSumarioCot.Sel(CodProcesso: Integer);
begin
  cdsList.Data := Cotacao.ListItensSumario( CodProcesso );
  btnGeraOC.Enabled  := Not cdsList.IsEmpty;
  btnConfSel.Enabled := Not cdsList.IsEmpty;
end;

procedure TfrmMTSumarioCot.BtnSelProcClick(Sender: TObject);
begin
   MontaSelect.Executar;
   if MontaSelect.RetornouValor Then
      Begin
         LbProc.Caption := MontaSelect.ValoresChave[0];

         If Modulo.sFormSumario = 'S' Then
            If Not Cotacao.CalculaSumario(StrToFloat(MontaSelect.ValoresChave[0])) Then
               MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0)
         Else
            Begin
              If MontaSelect.ValoresChave[3] = 'P' then
                 lbStatus.Caption := 'Pendente de Cotação'
              else
              If MontaSelect.ValoresChave[3] = 'C' then
                 lbStatus.Caption := 'Em Cotação'
              else
              If MontaSelect.ValoresChave[3] = 'S' then
                 lbStatus.Caption := 'Sumário já Calculado'
              else
              If MontaSelect.ValoresChave[3] = 'O' then
                 lbStatus.Caption := 'Pronta para Gerar O.C.'
              else
              If MontaSelect.ValoresChave[3] = 'F' then
                 lbStatus.Caption := 'O.C. já Gerada';
              lbStatus.Visible := True;
            End;
         Sel(StrToInt(MontaSelect.ValoresChave[0]));

         btnConfSel.Enabled := True;
         btnGeraOC.Enabled  := True;
      End
   Else
      Begin
         LbProc.Caption     := '';
         btnConfSel.Enabled := False;
         btnGeraOC.Enabled  := False;
         lbStatus.Visible   := False;
      End;
end;

procedure TfrmMTSumarioCot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cotacao.Free;
end;

procedure TfrmMTSumarioCot.dsListDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (cdsList.State <> dsInactive) And ( Not bVerifStatus ) Then
     Begin
        cdsSumario.Data := Cotacao.ListSumario(cdsList.FieldByName('CODPROCESSO').AsFloat,
                                               cdsList.FieldByName('IDPROCXART').AsFloat);

        TStringField(cdsSumario.FieldByName('STATUS')).Alignment := taCenter;
        TFloatField(cdsSumario.FieldByName('PRECOAVALORPRES')).DisplayFormat := '#,##0.00';
        TFloatField(cdsSumario.FieldByName('PRECOTOTAL')).DisplayFormat      := '#,##0.00';
        TFloatField(cdsSumario.FieldByName('PRECO')).DisplayFormat           := '#,##0.00';

     End;
end;

procedure TfrmMTSumarioCot.GrdCotacaoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  IF (Field.FieldName = 'STATUS') Then
     Begin
         If Field.AsString = 'S' Then
            ABrush.Color  := $0080FFFF
         Else
         If Field.AsString = 'U' Then
            ABrush.Color  := $00B7C1FF
         Else
         If Field.AsString = 'C' Then
            ABrush.Color  := $0080FF80;
         If Highlight Then
            AFont.Color := clBlack;
     End;
end;

procedure TfrmMTSumarioCot.FormShow(Sender: TObject);
begin
  inherited;
  If Sistema.IdRAD > 0 Then
     Begin
         spRAD.Prepare;
         spRAD.ParamByName('IDPROCESSO').AsFloat := Sistema.IdRAD;
         spRAD.Open;

         Modulo.sFormSumario := 'S';
         LbProc.Caption      := CdsRAD.FieldByName('CODPROCESSO').AsString;

         Sel(CdsRAD.FieldByName('CODPROCESSO').AsInteger);

         btnGeraOC.Visible  := False;
         BtnSelProc.Visible := False;
         btnConfSel.Visible := False;
     End;

  If Modulo.sFormSumario = 'S' then
     Begin
        Self.Caption          := 'Sumário de Cotação';
        Self.HelpContext      := 1130012;
        bbtnAjuda.HelpContext := 1130012;
     End
  else
     Begin
        Self.Caption          := 'Consulta Sumário de Cotação';
        Self.HelpContext      := 1130039;
        bbtnAjuda.HelpContext := 1130019;
     End;

  Application.ProcessMessages;
end;

function TfrmMTSumarioCot.PedeObsJust(cTipo: Char; sCompl: String): String;
begin
   sMem := '';
   Application.CreateForm(TFrmMTJustif,FrmMTJustif);
   FrmMTJustif.Tipo   := cTipo;
   FrmMTJustif.sCompl := sCompl;
   FrmMTJustif.ShowModal;
   Result := sMem;
end;

procedure TfrmMTSumarioCot.GrdCotacaoDblClick(Sender: TObject);
var
  ptrBookMark: TBookMark;

   procedure TrataSelecao(sStatusSel: string);
        var
           SelForCli: integer; // Id do fornecedor selecionado
        begin
           {**           STATUS DO PROCESSO
             NÃO PODE OCORRER OS SEGUINTES CASOS: 'C' com 'S' , 'U' com 'C'
           **}
           SelForCli := cdsSumario.FieldByName('IDFORCLI').AsInteger;

           cdsSumario.DisableControls;
           cdsSumario.First;
           while not cdsSumario.Eof do
           begin
              if SelForCli = cdsSumario.FieldByName('IDFORCLI').AsInteger then
              begin
                 cdsSumario.Next;
                 Continue;
              end;

             if sStatusSel = 'S' then
             begin
               if (cdsSumario.FieldByName('STATUS').AsString = 'C') then
               begin
                  cdsSumario.Edit;
                  cdsSumario.FieldByName('STATUS').Value := NULL;
                  cdsSumario.Post;
               end;
             end
             else if sStatusSel = 'C' then
                  begin
                    cdsSumario.Edit;
                    cdsSumario.FieldByName('STATUS').Value := NULL;
                    cdsSumario.Post;
                  end
             else if sStatusSel = 'U' then
                  begin
                    if (cdsSumario.FieldByName('STATUS').AsString = 'C') then
                    begin
                       cdsSumario.Edit;
                       cdsSumario.FieldByName('STATUS').Value := 'S';
                       cdsSumario.Post;
                    end
                    else
                    begin
                       if (cdsSumario.FieldByName('STATUS').AsString = 'U') then
                       begin
                          cdsSumario.Edit;
                          cdsSumario.FieldByName('STATUS').Value := NULL;
                          cdsSumario.Post;
                       end
                    end;
                  end;

             If Not Cotacao.GravaStatus(cdsSumario.FieldByName('CODPROCESSO').AsFloat,
                                        cdsSumario.FieldByName('IDPROCXART').AsFloat,
                                        cdsSumario.FieldByName('PROPOSTA').AsFloat,
                                        cdsSumario.FieldByName('IDFORCLI').AsFloat,
                                        cdsSumario.FieldByName('STATUS').AsString,
                                        cdsSumario.FieldByName('JUSTIFICATIVA').AsString) then
                 MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0);

             cdsSumario.Next;
           end;
           cdsSumario.EnableControls;
        end;
begin
  inherited;
  If (Modulo.sFormSumario = 'S') And (Not cdsSumario.FieldByName('PRECOAVALORPRES').IsNull) Then
     Begin

        bVerifStatus := True;
     // Se fornecedor selecionado tem restrição, mostrar
         cdsSumario.Edit;
         If cdsSumario.FieldByName('STATUS').AsString = 'C' Then
            cdsSumario.FieldByName('STATUS').AsString := 'S'
         Else
         If cdsSumario.FieldByName('STATUS').AsString = 'S' Then
            cdsSumario.FieldByName('STATUS').AsString := 'C'
         Else
         If cdsSumario.FieldByName('STATUS').AsString = 'U' Then
            Begin
               cdsSumario.FieldByName('STATUS').Clear;
               cdsSumario.FieldByName('JUSTIFICATIVA').Clear;
            End
         Else
            cdsSumario.FieldByName('STATUS').AsString := 'U';
         cdsSumario.Post;
         // Caso usuário selecione um fornecedor que não seja
         // o sugerido pelo sistema é obrigado a justificar
         If cdsSumario.FieldByName('STATUS').AsString = 'U' Then
            Begin
               GrdCotacao.Invalidate;
               Application.ProcessMessages;
               cdsSumario.Edit;
               cdsSumario.FieldByName('JUSTIFICATIVA').asString := PedeObsJust('J','');
               cdsSumario.Post;
               GrdCotacao.Invalidate;
            End;


         // Guarda o ponteiro do registro selecionado (no DoubleClick)
         ptrBookMark := cdsSumario.GetBookmark;
         // Trata da mútua exclusão entre os status
         TrataSelecao(cdsSumario.FieldByName('STATUS').AsString);
         // retorna ao registro que estava posicionado antes de entrar em TrataSelecao
         cdsSumario.GotoBookmark(ptrBookMark);

         If Not Cotacao.GravaStatus( cdsSumario.FieldByName('CODPROCESSO').AsFloat,
                                    cdsSumario.FieldByName('IDPROCXART').AsFloat,
                                    cdsSumario.FieldByName('PROPOSTA').AsFloat,
                                    cdsSumario.FieldByName('IDFORCLI').AsFloat,
                                    cdsSumario.FieldByName('STATUS').AsString,
                                    cdsSumario.FieldByName('JUSTIFICATIVA').AsString ) then
           MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0);

         cdsSumario.FreeBookmark(ptrBookMark);
     End;
   bVerifStatus := False;
end;

procedure TfrmMTSumarioCot.btnConfSelClick(Sender: TObject);
begin
  inherited;
  cdsList.DisableControls;
  Try
     cdsList.First;
     While Not cdsList.EOF Do
        Begin
           cdsSumario.Data := Cotacao.ListSumario(cdsList.FieldByName('CODPROCESSO').AsFloat,
                                                  cdsList.FieldByName('IDPROCXART').AsFloat);
           If Not Cotacao.ProcessaSelecao Then
              Begin
                 MsgDlg(Cotacao.MessageInfo,'Erro',MtError,[mbOk],0);
                 Abort;
              End;
           cdsList.Next;
        End;
  Finally
     cdsList.EnableControls;
     cdsList.First;
  End;

end;

procedure TfrmMTSumarioCot.btnGeraOCClick(Sender: TObject);
Var
   cds : TClientDataSet;
begin
  inherited;
  If Cotacao.PodeGerarOC(cdsSumario.FieldByName('CODPROCESSO').AsFloat, Sistema.usaRAD ) Then
     Begin
        cds := TClientDataSet.Create(Self);
        Try
           cds.Data := Cotacao.SimulaVencedores(cdsSumario.FieldByName('CODPROCESSO').AsFloat);
           cds.First;
           While Not cds.Eof Do
              Begin
                  cds.Edit;
                  cds.FieldByName('OBSOC').AsString         := PedeObsJust('C',cds.FieldByName('RAZAOSOCIAL').AsString);
                  cds.FieldByName('FLGTIPOFRETE').AsInteger := iFrete;
                  //***
                  cds.post;
                  cds.Next;
              End;
           If Not Cotacao.GeraOC(cdsSumario.FieldByName('CODPROCESSO').AsFloat,
                                 Sistema.IdUsuario,
                                 cds.Data,
                                 Modulo.sFlgObsSCIOC = 'S' )
           Then
              MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0)
           Else
              Begin
                 MsgDlg(Cotacao.MessageInfo, 'Informação', mtInformation, [mbOk], 0);

                 If (Modulo.ModeloImpOC > 0) And (MsgDlg('Deseja imprimir a(s) O.C.(s) gerada(s) ?','Confirmação',mtConfirmation,[mbYes,mbNo],0)= mrYes)
                   Then
                     ImpOC(Cotacao.NumOC,Cotacao.NumOCFim);
              End;
        Finally
           cds.Free;
        End;
     End
  Else
     MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0);

  Sel(-1);
end;

procedure TfrmMTSumarioCot.ImpOC(NumI, NumF: Double);
begin
   Application.CreateForm(TFrmParamImpOC,FrmParamImpOC);
   try
      // Devido a tela de parametros o Itemindex do Modelo comecar do zero
      DtmRelCompras.iModelo      := Modulo.ModeloImpOC - 1;
      FrmParamImpOC.edNumI.Value := NumI;
      FrmParamImpOC.edNumF.Value := NumF;
      FrmParamImpOC.bbtnConfirmar.Click;
      //
      Case Modulo.ModeloImpOC Of
         1 : begin
                PreparappOC(NumI, NumF);
                ppOC.Print;
             end;
         2 : DtmRelCompras.ppOCM1.Print;
         3 : DtmRelCompras.ppOCM2.Print;
      End;
   Finally
      FrmParamImpOC.Free;
   End;
end;

procedure TfrmMTSumarioCot.FormActivate(Sender: TObject);
begin
  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);
end;

procedure TfrmMTSumarioCot.PreparappOC(iOCIni, iOCFim: extended);
begin
  DtmCompras.qryEndCobEnt.Close;
  DtmCompras.qryEndCobEnt.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  DtmCompras.qryEndCobEnt.Open;

//---------------------------------------------------------------------------------------------------------------------------------------
//  ORDEM DE COMPRAS MODELO DFAULT
//---------------------------------------------------------------------------------------------------------------------------------------
  DtmRelCompras.qryPrazoOC.Close;
  DtmRelCompras.qryAgregOC.Close;
  DtmRelCompras.qryCompOC.Close;
   //
  DtmRelCompras.qryPrazoOC.DataSource := DtmRelCompras.dsOC;
  DtmRelCompras.qryAgregOC.DataSource := DtmRelCompras.dsOC;
  DtmRelCompras.qryCompOC.DataSource  := DtmRelCompras.dsOC;
   //
  DtmRelCompras.qryPrazoOC.Open;
  DtmRelCompras.qryAgregOC.Open;
  DtmRelCompras.qryCompOC.Open;
   //
  LbEndEnt.Caption    := Trim(DtmCompras.qryEndCobEntENDENT.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMENT.AsString);
  LbCompEnt.Caption   := DtmCompras.qryEndCobEntCOMPLENT.AsString;
  LbCidadeEnt.Caption := DtmCompras.qryEndCobEntCIDADEENT.AsString;
  LbBairroEnt.Caption := DtmCompras.qryEndCobEntBAIRROENT.AsString;
  LbUFEnt.Caption     := DtmCompras.qryEndCobEntUFENT.AsString;
   //
  LbEndCob.Caption    := Trim(DtmCompras.qryEndCobEntENDCOB.AsString) +' Nº '+Trim(DtmCompras.qryEndCobEntNUMCOB.AsString);
  LbCompCob.Caption   := DtmCompras.qryEndCobEntCOMPLCOB.AsString;
  LbCidadeCob.Caption := DtmCompras.qryEndCobEntCIDADECOB.AsString;
  LbBairroCob.Caption := DtmCompras.qryEndCobEntBAIRROCOB.AsString;
  LbUFCob.Caption     := DtmCompras.qryEndCobEntUFCOB.AsString;
   //
  if Sistema.idiomaAtivo = 1 Then
     Begin // Idioma Português
         LbCepEnt.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPENT.AsString);
         LbCepCob.Caption    := FormatMaskText('00000-999;0;',DtmCompras.qryEndCobEntCEPCOB.AsString);
         LbNumDocEnt.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
         LbNumDocCob.Caption := FormatMaskText('00.000.000/0000.000;0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
      End
  Else
      Begin // outros idiomas
         LbCepEnt.Caption    := DtmCompras.qryEndCobEntCEPENT.AsString;
         If DtmCompras.qryEndCobEntMASCARA.IsNull Then
            Begin
               LbNumDocEnt.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
               LbNumDocCob.Caption := DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString;
            End
         Else
            Begin
               LbNumDocEnt.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
               LbNumDocCob.Caption  := FormatMaskText( Trim(DtmCompras.qryEndCobEntMASCARA.AsString) + ';0;',DtmCompras.qryEndCobEntNUMDOCUMENTO.AsString);
            End;
         LbCepCob.Caption    := DtmCompras.qryEndCobEntCEPCOB.AsString;
      End;

   With qryOC Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT /*+ rule */                                                         ');
         Sql.Add('      P.RAZAOSOCIAL,                                                       ');
         Sql.Add('      P.NOME,                                                              ');
         Sql.Add('      P.NUMDOCUMENTO,                                                      ');
         Sql.Add('     (E.LOGRADOURO ||'' ''|| E.NUMERO) AS ENDERECO,                        ');
         Sql.Add('      E.COMPLEMENTO,                                                       ');
         Sql.Add('      E.BAIRRO,                                                            ');
         Sql.Add('      E.CEP,                                                               ');
         Sql.Add('      ES.CODESTADO,                                                        ');
         Sql.Add('      P.EMAIL,                                                             ');
         Sql.Add('      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,                ');
         Sql.Add('      TC.TELEFONE,                                                         ');
         Sql.Add('      TC.DDD,                                                              ');
         Sql.Add('      O.NUMOC,                                                             ');
         Sql.Add('      O.IDFORCLI,                                                          ');
         Sql.Add('      O.OCATENDIDA,                                                        ');
         Sql.Add('      O.FLGIMPRESSA,                                                       ');
         Sql.Add('      O.FLGCOMSEMOC,                                                       ');
         Sql.Add('      O.FLGCOMSEMCOT,                                                      ');
         Sql.Add('      O.OBSOC,                                                             ');
         Sql.Add('      O.DATAOC,                                                            ');
         Sql.Add('      DECODE(O.FLGTIPOFRETE,1,''CIF'',''FOB'') AS FRETE,                   ');
         Sql.Add('      I.CODARTIGO,                                                         ');
         Sql.Add('      I.CODMEDIDA,                                                         ');
         Sql.Add('      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,  ');
         Sql.Add('      I.VALORUN,                                                           ');
         Sql.Add('      PE.QTDEENTREGA,                                                      ');
         Sql.Add('      PE.DATAENTREGA,                                                      ');
         Sql.Add('      PE.PRAZOENTREGA,                                                     ');
         Sql.Add('      IMP.TOTIMP,                                                          ');
         Sql.Add('      TOT.TOTITEM,                                                         ');
         Sql.Add('      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTITEM,                            ');
         Sql.Add('      (DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTOC,         ');
         Sql.Add('      PR.DESCRCOMPL,                                                       ');
         Sql.Add('      I.OBSITEMOC,                                                         ');
         Sql.Add('      O.CONTATO                                                            ');
         Sql.Add('FROM                                                                       ');
         Sql.Add('     PESSOA P,                                                             ');
         Sql.Add('     ENDPESS E,                                                            ');
         Sql.Add('     CIDADES C,                                                            ');
         Sql.Add('     ESTADO  ES,                                                           ');
         Sql.Add('     (                                                                     ');
         Sql.Add('      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD            ');
         Sql.Add('      FROM  TELENDPESS  TP,                                                ');
         Sql.Add('           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE               ');
         Sql.Add('            FROM TELENDPESS                                                ');
         Sql.Add('            WHERE (TIPO LIKE ''%C%'')                                      ');
         Sql.Add('            GROUP BY IDENDERECO) C                                         ');
         Sql.Add('      WHERE (TP.IDENDERECO = C.IDENDERECO) AND                             ');
         Sql.Add('            (TP.IDTELEFONE = C.IDTELEFONE)                                 ');
         Sql.Add('      ) TC,                                                                ');
         Sql.Add('      ITEMOC I,                                                            ');
         Sql.Add('      OC O,                                                                ');
         Sql.Add('      ARTIGO A,                                                            ');
         Sql.Add('      PRODUTO PR,                                                          ');
         Sql.Add('      PRODVARI PV,                                                         ');
         Sql.Add('      PRAZOENTREGAOC PE,                                                   ');
         Sql.Add('      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM            ');
         Sql.Add('       FROM ITEMOC I, PRAZOENTREGAOC PE                                    ');
         Sql.Add('       WHERE                                                               ');
         Sql.Add('              ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
         Sql.Add('          AND  (I.IDITEMOC = PE.IDITEMOC)                                  ');
         Sql.Add('       GROUP BY I.NUMOC) TOT,                                              ');
         Sql.Add('      ((SELECT AOC.NUMOC,                                                  ');
         Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AOC.VLRAGREGTOT*-1),AOC.VLRAGREGTOT)) AS TOTIMP ');
         Sql.Add('        FROM  AGREGTOTOC AOC,                                              ');
         Sql.Add('              TIPOAGRE T                                                   ');
         Sql.Add('        WHERE                                                              ');
         Sql.Add('               (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6'')) ');
         Sql.Add('           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                 ');
         Sql.Add('        GROUP BY AOC.NUMOC)                                                ');
         Sql.Add('        UNION                                                              ');
         Sql.Add('       (SELECT I.NUMOC,                                                    ');
         Sql.Add('               SUM(DECODE(T.CODTRATFISCE,''6'',(AI.VLRAGREGITEM*-1),AI.VLRAGREGITEM)) AS TOTIMP');
         Sql.Add('        FROM  AGREGITEMOC AI,                                              ');
         Sql.Add('              TIPOAGRE T,                                                  ');
         Sql.Add('              ITEMOC I                                                     ');
         Sql.Add('        WHERE                                                              ');
         Sql.Add('              (T.CODTRATFISCE IN (''1'',''3'',''4'',''5'',''9'',''A'',''6''))');
         Sql.Add('          AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))');
         Sql.Add('          AND (I.IDITEMOC = AI.IDITEMOC)                                   ');
         Sql.Add('          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)                   ');
         Sql.Add('        GROUP BY I.NUMOC)) IMP                                             ');
         Sql.Add('WHERE (O.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')');
         Sql.Add('  AND ((I.FLGITEMATENDIDO <> ''C'') OR (I.FLGITEMATENDIDO IS NULL))        ');
         Sql.Add('  AND (O.NUMOC = I.NUMOC)                   ');
         Sql.Add('  AND (P.IDPESSOA = O.IDFORCLI)             ');
         Sql.Add('  AND (I.CODARTIGO = A.CODARTIGO)           ');
         Sql.Add('  AND (A.CODPRODUTO = PR.CODPRODUTO)        ');
         Sql.Add('  AND (I.IDPRODVARI = PV.IDPRODVARI(+))     ');
         Sql.Add('  AND (PE.IDITEMOC = I.IDITEMOC)            ');
         Sql.Add('  AND (IMP.NUMOC(+) = O.NUMOC)              ');
         Sql.Add('  AND (TOT.NUMOC = O.NUMOC)                 ');
         Sql.Add('  AND (P.IDPESSOA       = O.IDFORCLI)       ');
         Sql.Add('  AND (E.IDPESSOA(+)    = P.IDPESSOA)       ');
         Sql.Add('  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL) ');
         Sql.Add('  AND (E.IDCIDADES      = C.IDCIDADES(+))   ');
         Sql.Add('  AND (ES.IDESTADO(+)   = C.IDESTADO)       ');
         Sql.Add('  AND (TC.IDENDERECO(+) = E.IDENDERECO)     ');
         Sql.Add('ORDER BY O.NUMOC, I.IDITEMOC                ');
         Open;
      end;
end;

end.

//Verifica se já está implementado a impressão de OC direto.


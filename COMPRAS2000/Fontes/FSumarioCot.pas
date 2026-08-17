unit FSumarioCot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Grids, mxgrid, mxDB, Db, DBTables,
  mxtables, mxstore, DBCGrids, Wwquery, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  ComCtrls, Menus, TB97Ctls, ppForms, ppPrvDlg, uCmFileUtils;

type
  TFrmSumarioCot = class(TfrmSairAjuda)
    btnConfSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    MontaSelect: TMontaSelect;
    plnTitulo: TPanel;
    qryCotacao: TwwQuery;
    updCotacao: TUpdateSQL;
    GrdCotacao: TwwDBGrid;
    Splitter1: TSplitter;
    grdArt: TwwDBGrid;
    qryProcxArt: TwwQuery;
    dsProcxArt: TwwDataSource;
    dsCotacao: TwwDataSource;
    qryProcxArtIDPROCXART: TFloatField;
    qryProcxArtCODPROCESSO: TFloatField;
    qryProcxArtCODARTIGO: TStringField;
    qryProcxArtQTDEPEDIDA: TFloatField;
    qryProcxArtCODMEDIDA: TStringField;
    qryProcxArtJUSTIFICATIVA: TStringField;
    qryProcxArtSTATUS: TStringField;
    qryProcxArtDESCRICAO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbProc: TLabel;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoCODPROCESSO: TFloatField;
    qryCotacaoPROPOSTA: TFloatField;
    qryCotacaoQTDEFORNECIDA: TFloatField;
    qryCotacaoPRECO: TFloatField;
    qryCotacaoCODMEDIDA: TStringField;
    qryCotacaoNUMCOT: TFloatField;
    qryCotacaoDATACOT: TDateTimeField;
    qryCotacaoSTATUS: TStringField;
    qryCotacaoOBS: TStringField;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoTXJUROS: TFloatField;
    qryCotacaoPRECOAVALORPRES: TFloatField;
    qryCotacaoRAZAOSOCIAL: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    updProc: TUpdateSQL;
    qryProc: TwwQuery;
    qryProcCODPROCESSO: TFloatField;
    qryProcSTATUS: TStringField;
    qryCalcCotacao: TwwQuery;
    udpCalcCotacao: TUpdateSQL;
    qryCalcCotacaoIDFORCLI: TFloatField;
    qryCalcCotacaoIDPROCXART: TFloatField;
    qryCalcCotacaoCODPROCESSO: TFloatField;
    qryCalcCotacaoPROPOSTA: TFloatField;
    qryCalcCotacaoQTDEFORNECIDA: TFloatField;
    qryCalcCotacaoPRECO: TFloatField;
    qryCalcCotacaoSTATUS: TStringField;
    qryCalcCotacaoMOECODIGO: TFloatField;
    qryCalcCotacaoTXJUROS: TFloatField;
    qryCalcCotacaoPRECOAVALORPRES: TFloatField;
    qryPrazoPag: TwwQuery;
    dsCalcCotacao: TwwDataSource;
    qryPrazoPagIDPROCXART: TFloatField;
    qryPrazoPagIDFORCLI: TFloatField;
    qryPrazoPagCODPROCESSO: TFloatField;
    qryPrazoPagPROPOSTA: TFloatField;
    qryPrazoPagIDPRAZOPGTO: TFloatField;
    qryPrazoPagPRAZOPGTO: TFloatField;
    qryPrazoPagPERIODOPRAZO: TStringField;
    qryPrazoPagDATAPGTO: TDateTimeField;
    qryPrazoPagPERCENT: TFloatField;
    qryAgreg: TwwQuery;
    qryAgregIDPROCXART: TFloatField;
    qryAgregIDFORCLI: TFloatField;
    qryAgregCODPROCESSO: TFloatField;
    qryAgregPROPOSTA: TFloatField;
    qryAgregCODTIPOCUSTAGREG: TFloatField;
    qryAgregPERCENT: TFloatField;
    qryAgregVALOR: TFloatField;
    qryAgregFLGBASE: TStringField;
    qryCotacaoMOESIGLA: TStringField;
    qryAgregCODTRATFISCE: TStringField;
    lbBar: TLabel;
    pgBar: TProgressBar;
    BtnSelProc: TSpeedButton;
    btnGeraOC: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    UpdProcxArt: TUpdateSQL;
    qryVerifCotacao: TwwQuery;
    qryVerifCotacaoSTATUS: TStringField;
    qryVerifOC: TwwQuery;
    qryVerifOCIDPROCXART: TFloatField;
    qryVerifOCCODARTIGO: TStringField;
    qryVerifOCDESCRICAO: TStringField;
    qryWins: TwwQuery;
    qryWinsCODPROCESSO: TFloatField;
    qryWinsIDFORCLI: TFloatField;
    qryWinsPROPOSTA: TFloatField;
    qryWinsIDPESSOA: TFloatField;
    qryWinsIDPROCXART: TFloatField;
    qryWinsCODARTIGO: TStringField;
    qryWinsCODMEDIDA: TStringField;
    qryWinsIDPRODVARI: TFloatField;
    qryWinsQTDEOC: TFloatField;
    qryWinsOBS: TStringField;
    qryWinsVALOR: TFloatField;
    qryWinPag: TwwQuery;
    qryWinAgreg: TwwQuery;
    qryWinEnt: TwwQuery;
    qryWinEntIDPRAZOENT: TFloatField;
    qryWinEntQTDEENT: TFloatField;
    qryWinEntCODMEDIDA: TStringField;
    qryWinEntPRAZOENT: TFloatField;
    qryWinEntPERIODOPRAZO: TStringField;
    qryWinEntDATAENT: TDateTimeField;
    qryWinPagPRAZOPGTO: TFloatField;
    qryWinPagPERIODOPRAZO: TStringField;
    qryWinPagDATAPGTO: TDateTimeField;
    qryWinPagPERCENT: TFloatField;
    qryWinEntQTDEFORNECIDA: TFloatField;
    qryWinAgregCODTIPOCUSTAGREG: TFloatField;
    qryWinAgregPERCENT: TFloatField;
    qryWinAgregVALOR: TFloatField;
    qryWinAgregBASECALCULO: TFloatField;
    qryWinSCItemOC: TwwQuery;
    qryWinSCItemOCNUMSOLCOMPRA: TFloatField;
    qryWinSCItemOCIDITEMSOLI: TFloatField;
    updWins: TUpdateSQL;
    qryWinsIDITEMOC: TFloatField;
    lbStatus: TLabel;
    qryVerifRadSCI: TwwQuery;
    qryVerifRadSCIIDPROCESSO: TFloatField;
    qryVerifRadSCINUMSOLCOMPRA: TFloatField;
    qryWinAgregCODTRATFISCE: TStringField;
    qryWinsRAZAOSOCIAL: TStringField;
    qrySCIOC: TwwQuery;
    qrySCIOCIDPROCESSO: TFloatField;
    qrySCIOCNUMSOLCOMPRA: TFloatField;
    qrySCIOCIDRESERVAORCAMEN: TFloatField;
    qryTestaReservaOrc: TwwQuery;
    qryWinsOBSITEMSOLIC: TStringField;
    qryWinsCODGRUPOPROD: TStringField;
    qryWinsCONTATO: TStringField;
    qryWinsDESCPROD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdCotacaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdCotacaoTopRowChanged(Sender: TObject);
    procedure GrdCotacaoDblClick(Sender: TObject);
    procedure BtnSelProcClick(Sender: TObject);
    procedure dsProcxArtDataChange(Sender: TObject; Field: TField);
    procedure btnConfSelClick(Sender: TObject);
    procedure btnGeraOCClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    bVerifStatus : Boolean;
    //
    Procedure Sel( CodProc : LongInt );
    Procedure CalcSumario( CodProc : LongInt );
    Procedure VerifStatus( CodProc : LongInt );
    Function  VerifOC( CodProc : LongInt ) : Boolean;
    procedure GeraOC( CodProc : LongInt );
    Function  PedeObsJust(cTipo : Char; sCompl : String ) : String;
    Procedure ImpOC( NumI,NumF : int64);
  public
    { Public declarations }
    sMem   : String;
    iFrete : Byte;
  end;

var
  FrmSumarioCot: TFrmSumarioCot;
  iIdTipoProcesso : LongInt;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, uFuncaoGeral, Math, uDataBase,
     FJustif, DCompras, uModulo,uRAD, dBaseDados,
     uOrcamento,FParamImpOC,DRelCompras;

procedure TFrmSumarioCot.FormCreate(Sender: TObject);
begin
  inherited;
  //
  OrcamentoBack   := TOrcamentoBack.Create;
  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
     Begin
         Rad := TRad.Create;
         If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 5)') Then
            Begin
                iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
            End;
     End;
  bVerifStatus     := False;
  lbbar.Visible    := False;
  pgBar.Visible    := False;
  lbStatus.Visible := False;
  btnGeraOC.Visible   := Modulo.sFormSumario = 'S';
  btnConfSel.Visible  := Modulo.sFormSumario = 'S';
  GrdCotacao.ShowHint := Modulo.sFormSumario = 'S';
  qryCalcCotacao.Close;
  If Not qryCotacao.Prepared Then qryCotacao.Prepare;
  qryCalcCotacao.Close;
  If Not qryCalcCotacao.Prepared Then qryCalcCotacao.Prepare;
  qryProcxArt.Close;
  If Not qryProcxArt.Prepared Then qryProcxArt.Prepare;
  qryPrazoPag.Close;
  If Not qryPrazoPag.Prepared Then qryPrazoPag.Prepare;
  qryAgreg.Close;
  If Not qryAgreg.Prepared Then qryAgreg.Prepare;
  qryVerifOC.Close;
  If Not qryVerifOC.Prepared Then qryVerifOC.Prepare;
  qryWins.Close;
  If Not qryWins.Prepared Then qryWins.Prepare;
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

procedure TFrmSumarioCot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
  OrcamentoBack.Free;
  qryCotacao.Close;
  If qryCotacao.Prepared Then qryCotacao.UnPrepare;
  qryProcxArt.Close;
  If qryProcxArt.Prepared Then qryProcxArt.UnPrepare;
  qryCalcCotacao.Close;
  If qryCalcCotacao.Prepared Then qryCalcCotacao.UnPrepare;
  qryPrazoPag.Close;
  If qryPrazoPag.Prepared Then qryPrazoPag.UnPrepare;
  qryAgreg.Close;
  If qryAgreg.Prepared Then qryAgreg.UnPrepare;
  qryVerifOC.Close;
  If qryVerifOC.Prepared Then qryVerifOC.UnPrepare;
  qryWins.Close;
  If qryWins.Prepared Then qryWins.UnPrepare;
end;

procedure TFrmSumarioCot.BtnSelProcClick(Sender: TObject);
begin
  inherited;
   MontaSelect.Executar;
   if MontaSelect.RetornouValor Then
      Begin
         LbProc.Caption := MontaSelect.ValoresChave[0];
         if Modulo.sFormSumario = 'S' Then
            CalcSumario(StrToInt(MontaSelect.ValoresChave[0]))
         else
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

Procedure TFrmSumarioCot.Sel( CodProc : LongInt );
Begin
  qryProcxArt.Close;
  qryProcxArt.ParamByName('CODPROCESSO').AsInteger := CodProc;
  qryProcxArt.Open;
End;

procedure TFrmSumarioCot.GrdCotacaoCalcCellColors(Sender: TObject;
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

procedure TFrmSumarioCot.CalcSumario( CodProc : LongInt );
Var
  rValorAux : Double;
  rValor    : Double;
  rAux      : Double;
  cAux      : Array [0..1] of Char;
begin
   If Not qryProcxArt.IsEmpty Then Sel( -1 );
   qryCalcCotacao.Close;
   qryCalcCotacao.ParamByName('CODPROCESSO').AsInteger := CodProc;
   qryCalcCotacao.Open;
   //
   qryProc.Close;
   qryProc.ParamByName('pCODPROCESSO').AsInteger := CodProc;
   qryProc.Open;
   //
   lbbar.Visible  := True;
   pgBar.Visible  := True;
   pgBar.Min      := 0;
   pgBar.Position := 0;
   pgBar.Max      := qryCalcCotacao.RecordCount;
   //
   qryAgreg.Open;
   qryPrazoPag.Open;
   //
   qryCalcCotacao.First;
   While Not qryCalcCotacao.EOF Do
      Begin
         // Verifica se o Fornecedor possui esse produto
         If (qryCalcCotacaoPRECO.IsNull) or (qryCalcCotacaoPRECO.AsFloat <= 0) Then
            Begin
              qryCalcCotacao.Edit;
              qryCalcCotacaoPRECOAVALORPRES.Clear;
              qryCalcCotacao.Post;
            End
         Else
            Begin
                rValorAux := qryCalcCotacaoPRECO.AsFloat*qryCalcCotacaoQTDEFORNECIDA.AsFloat;
                // Calcula incidencia de custos agregado (Encargos)
                qryAgreg.First;
                While Not qryAgreg.EOF Do
                    Begin
                       StrPcopy(cAux,qryAgregCODTRATFISCE.AsString);
                       If cAux[0] in ['1','3','4','5','9','A'] Then
                          rValorAux := rValorAux + qryAgregVALOR.AsFloat
                       Else
                          If cAux[0] in ['2','6'] Then
                             rValorAux := rValorAux - qryAgregVALOR.AsFloat;
                       qryAgreg.Next;
                    End;
                // Converte o valor para a moeda corrente
                If Not qryCalcCotacaoMOECODIGO.IsNull Then
                   rValorAux := rValorAux * FuncaoGeral.TestaCotacaoMoeda(qryCalcCotacaoMOECODIGO.AsInteger,DateToStr(Date),'N');
                rValorAux := rValorAux / qryCalcCotacaoQTDEFORNECIDA.AsFloat;
                rValor := 0;
                // Calcula fórmula de prazo de pagamento
                qryPrazoPag.First;
                While Not qryPrazoPag.EOF Do
                    Begin
                       rAux   := Power((1 + (qryCalcCotacaoTXJUROS.AsFloat/100)) , (qryPrazoPagPRAZOPGTO.AsFloat/30));
                       rValor := rValor + ((rValorAux * (qryPrazoPagPERCENT.AsFloat/100)) / rAux);
                       qryPrazoPag.Next;
                    End;
                qryCalcCotacao.Edit;
                If qryPrazoPag.IsEmpty Then
                   qryCalcCotacaoPRECOAVALORPRES.AsFloat := rValorAux
                Else
                   qryCalcCotacaoPRECOAVALORPRES.AsFloat := rValor;
                qryCalcCotacao.Post;
            End;
         qryCalcCotacao.Next;
         PgBar.Position := PgBar.Position + 1;
         Application.ProcessMessages;
      End;
    If qryCalcCotacao.UpdatesPending Then
       Begin
           qryPROC.Edit;
           qryPROCSTATUS.AsString := 'S';
           qryPROC.Post;
           AplicaAlteracoes([qryCalcCotacao,qryProc])
       End;
    lbbar.Visible := False;
    pgBar.Visible := False;
    qryPrazoPag.Close;
    qryCalcCotacao.Close;
    VerifStatus( CodProc );
end;

Procedure TFrmSumarioCot.VerifStatus( CodProc : LongInt );
Var
   rValor : Double;
Begin
  //
  Sel( CodProc );
  bVerifStatus := True;
  qryProcxArt.DisableControls;
  qryCotacao.DisableControls;
  //
  qryProcxArt.First;
  While  Not qryProcxArt.EOF Do
      Begin
          qryCotacao.Close;
          qryCotacao.ParamByName('CODPROCESSO').AsInteger  := qryProcxArtCODPROCESSO.AsInteger;
          qryCotacao.ParamByName('IDPROCXART').AsInteger   := qryProcxArtIDPROCXART.AsInteger;
          qryCotacao.Open;
          qryCotacao.First;
          If Not qryCotacaoPRECOAVALORPRES.IsNull Then
             Begin
                rValor := qryCotacaoPRECOAVALORPRES.AsFloat;
                qryCotacao.Edit;
                If qryCotacaoSTATUS.AsString <> 'C' Then
                   qryCotacaoSTATUS.AsString := 'S';
                qryCotacao.Post;
                qryCotacao.Next;
                While Not qryCotacao.EOF Do
                    Begin
                        qryCotacao.Edit;
                        If Format('%12.2f',[rValor]) = Format('%12.2f',[qryCotacaoPRECOAVALORPRES.AsFloat]) Then
                           Begin
                              If qryCotacaoSTATUS.AsString <> 'C' Then
                                 qryCotacaoSTATUS.AsString := 'S';
                           End
                        Else
                          Begin
                              If (qryCotacaoSTATUS.AsString = 'C') Or (qryCotacaoSTATUS.AsString = 'U') Then
                                 qryCotacaoSTATUS.AsString := 'U'
                              Else
                                 qryCotacaoSTATUS.Clear;
                          End;
                        qryCotacao.Post;
                        qryCotacao.Next;
                    End;
             End;
          AplicaAlteracoes([qryCotacao]);
         qryProcxArt.Next;
      End;
   qryProcxArt.EnableControls;
   qryCotacao.EnableControls;
   bVerifStatus := False;
End;

procedure TFrmSumarioCot.GrdCotacaoTopRowChanged(Sender: TObject);
begin
  inherited;
  GrdCotacao.Invalidate;
end;

procedure TFrmSumarioCot.GrdCotacaoDblClick(Sender: TObject);
begin
  inherited;
  If (Modulo.sFormSumario = 'S') And (Not qryCotacaoPRECOAVALORPRES.IsNull) Then
     Begin
        bVerifStatus := True;
     // Se fornecedor selecionado tem restrição, mostrar
         qryCotacao.Edit;
         If qryCotacaoSTATUS.AsString = 'C' Then
            qryCotacaoSTATUS.AsString := 'S'
         Else
         If qryCotacaoSTATUS.AsString = 'S' Then
            qryCotacaoSTATUS.AsString := 'C'
         Else
         If qryCotacaoSTATUS.AsString = 'U' Then
            Begin
               qryCotacaoSTATUS.Clear;
               qryProcxArt.Edit;
               qryProcxArtJUSTIFICATIVA.Clear;
               qryProcxArt.Post;
            End
         Else
            qryCotacaoSTATUS.AsString := 'U';
         qryCotacao.Post;
         // Caso usuário selecione um fornecedor que não seja
         // o sugerido pelo sistema é obrigado a justificar
         If qryCotacaoSTATUS.AsString = 'U' Then
            Begin
               GrdCotacao.Invalidate;
               Application.ProcessMessages;
               qryProcxArt.Edit;
               qryProcxArtJUSTIFICATIVA.asString := PedeObsJust('J','');
               qryProcxArt.Post;
               GrdCotacao.Invalidate;
            End;
         AplicaAlteracoes([qryCotacao,qryProcxArt]);
     End;
    bVerifStatus := False;
{
3) Se sim, marcar o status da cotação para 'O' e liberar o botão de gerar OC.
 }
end;

procedure TFrmSumarioCot.dsProcxArtDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (qryProcxArt.State <> dsInactive) And ( Not bVerifStatus ) Then
     Begin
         qryCotacao.DisableControls;
         qryCotacao.Close;
         qryCotacao.ParamByName('CODPROCESSO').AsInteger  := qryProcxArtCODPROCESSO.AsInteger;
         qryCotacao.ParamByName('IDPROCXART').AsInteger   := qryProcxArtIDPROCXART.AsInteger;
         qryCotacao.Open;
         qryCotacao.EnableControls;
     End;
end;

procedure TFrmSumarioCot.btnConfSelClick(Sender: TObject);
Begin
  bVerifStatus := True;
  qryProcxArt.DisableControls;
  qryCotacao.DisableControls;
  //
  qryProcxArt.First;
  While  Not qryProcxArt.EOF Do
      Begin
          qryVerifCotacao.Close;
          qryVerifCotacao.ParamByName('CODPROCESSO').AsInteger  := qryProcxArtCODPROCESSO.AsInteger;
          qryVerifCotacao.ParamByName('IDPROCXART').AsInteger   := qryProcxArtIDPROCXART.AsInteger;
          qryVerifCotacao.Open;
          if qryVerifCotacao.IsEmpty Then
             Begin
                qryCotacao.Close;
                qryCotacao.ParamByName('CODPROCESSO').AsInteger  := qryProcxArtCODPROCESSO.AsInteger;
                qryCotacao.ParamByName('IDPROCXART').AsInteger   := qryProcxArtIDPROCXART.AsInteger;
                qryCotacao.Open;
                qryCotacao.First;
                If (Not qryCotacaoPRECOAVALORPRES.IsNull) and (qryCotacaoSTATUS.AsString = 'S') Then
                   Begin
                      qryCotacao.Next;
                      If (qryCotacao.EOF) Or (qryCotacaoSTATUS.AsString <> 'S')  Or (qryCotacaoSTATUS.IsNull) Then
                         Begin
                            qryCotacao.Prior;
                            qryCotacao.Edit;
                            qryCotacaoSTATUS.AsString := 'C';
                            qryCotacao.Post;
                            AplicaAlteracoes([qryCotacao]);                            
                         End;
                   End;
             End;
         qryProcxArt.Next;
      End;
   bVerifStatus := False;
   qryProcxArt.First;
   qryProcxArt.EnableControls;
   qryCotacao.EnableControls;

End;

Function TFrmSumarioCot.PedeObsJust(cTipo : Char; sCompl : String ) : String;
Begin
   sMem := '';
   Application.CreateForm(TFrmJustif,FrmJustif);
   FrmJustif.Tipo   := cTipo;
   FrmJustif.sCompl := sCompl;
   FrmJustif.ShowModal;
   Result := sMem;
End;

Function  TFrmSumarioCot.VerifOC( CodProc : LongInt ) : Boolean;
Var
   sResp : String;
Begin
     Result := True;
     qryVerifOC.Close;
     qryVerifOC.ParamByName('pCODPROCESSO').AsInteger := CodProc;
     qryVerifOC.Open;
     If Not qryVerifOC.IsEmpty Then
        Begin
             Result := False;
             sResp := 'O.C. não pode ser gerada. Existem artigo(s) sem seleção :';
             qryVerifOC.First;
             While Not qryVerifOC.EOF Do
                Begin
                    sResp := sResp + Chr(13)+ '   . '+ qryVerifOCCODARTIGO.AsString + ' - '+qryVerifOCDESCRICAO.AsString;
                    qryVerifOC.Next;
                End;
             MsgDlg(sResp,'Erro',mtError,[mbOk],0);
        End
     Else
        Begin
           If Sistema.UsaRAD Then
              Begin
                 qryVerifRadSCI.Close;
                 qryVerifRadSCI.ParamByName('pCODPROCESSO').AsInteger := CodProc;
                 qryVerifRadSCI.Open;
                 If Not qryVerifRadSCI.IsEmpty Then
                    Begin
                       Result := False;
                       sResp := 'O.C. não pode ser gerada. Existem Solicitações não autorizadas no RAD. Processos/SCIs : ';
                       qryVerifRadSCI.First;
                       While Not qryVerifRadSCI.EOF Do
                         Begin
                             sResp := sResp + Chr(13)+ '   . '+ qryVerifRadSCIIDPROCESSO.AsString+'/'+qryVerifRadSCINUMSOLCOMPRA.AsString;
                             qryVerifRadSCI.Next;
                         End;
                       MsgDlg(sResp,'Erro',mtError,[mbOk],0);
                    End;
              End;
        End;
End;


procedure TFrmSumarioCot.GeraOC( CodProc : LongInt );
Var
    iIdForCli         : LongInt;
    iIdPessoa         : LongInt;
    iProposta         : LongInt;
    sGerar            : String;
    x                 : Integer;
    rValorOC          : Double;
    cAux              : Array [0..1] of Char;
    iOrcament         : Array [0..100] of LongInt;
    iIdCompromisso    : LongInt;
    iNumCompromisso   : LongInt;
    iNumReserva       : LongInt;
    y                 : Integer;
    NumOCIni          : Integer;
    NumOCFim          : Integer;
Begin
   DtmCompras.SelOC(-1);
   NumOCIni  := 0;
   NumOCFim  := 0;
   With DtmCompras Do
      Begin
         qryWins.Close;
         qryWins.ParamByName('pCODPROCESSO').AsInteger := CodProc;
         qryWins.Open;
         qryWins.First;
         If Not qryWins.IsEmpty Then
            Begin
               Try
                  StartTransacao;
                  sGerar    := 'Foram gerada(s) a(s) O.C.(s) : ';
                  iIdForCli := qryWinsIDFORCLI.AsInteger;
                  iIdPessoa := qryWinsIDPESSOA.AsInteger;
                  iProposta := qryWinsPROPOSTA.AsInteger;
                  //--------------------------------------------------------------------------------------
                  // Grava a Ordem de Compra ( O.C.)
                  //--------------------------------------------------------------------------------------
                  qryOC.Append;
                  qryOCNUMOC.AsInteger        := LeUltRegistro(nil,'OC');
                  qryOCIDFORCLI.AsInteger     := qryWinsIDFORCLI.AsInteger;
                  qryOCIDPESSOA.AsInteger     := qryWinsIDPESSOA.AsInteger;
                  qryOCOCATENDIDA.AsString    := 'F';
                  qryOCFLGIMPRESSA.AsString   := 'F';
                  qryOCFLGCOMSEMOC.AsString   := 'C';
                  qryOCFLGCOMSEMCOT.AsString  := 'C';
                  qryOCDATAOC.AsDateTime      := Date;
                  qryOCOBSOC.AsString         := PedeObsJust('C',qryWinsRAZAOSOCIAL.AsString);
                  qryOCFLGTIPOFRETE.asInteger := iFrete;
                  qryOCCONTATO.asString       := qryWinsCONTATO.asString;
                  qryOC.Post;
                  sGerar := sGerar + chr(13)+' - O.C. Nº : '+ IntToStr(qryOCNUMOC.AsInteger);
                  // Gera o primeiro Nº da OC e ultimo da Nº da OC
                  If NumOCIni = 0 Then
                     NumOCIni := qryOCNUMOC.AsInteger;
                  NumOCFim := qryOCNUMOC.AsInteger;

                  While Not qryWins.EOF DO
                     Begin
                        rValorOC := 0;
                        // Caso mude o fornecedor ou a empresa deve ser gerada uma nova Order de Compra
                        If (qryWinsIDFORCLI.AsInteger <> iIdForCli) Or (qryWinsIDPESSOA.AsInteger <> iIdPessoa) Or (qryWinsPROPOSTA.AsInteger <> iProposta ) Then
                           Begin
                              qryOC.Append;
                              qryOCNUMOC.AsFloat        := LeUltRegistro(nil,'OC');
                              qryOCIDFORCLI.AsInteger   := qryWinsIDFORCLI.AsInteger;
                              qryOCIDPESSOA.AsInteger   := qryWinsIDPESSOA.AsInteger;
                              qryOCOCATENDIDA.AsString  := 'F';
                              qryOCFLGIMPRESSA.AsString := 'F';
                              qryOCFLGCOMSEMOC.AsString := 'C';
                              qryOCFLGCOMSEMCOT.AsString:= 'C';
                              qryOCDATAOC.AsDateTime    := Date;
                              qryOCOBSOC.AsString := PedeObsJust('C',qryWinsRAZAOSOCIAL.AsString);
                              qryOC.Post;
                              iIdForCli := qryWinsIDFORCLI.AsInteger;
                              iIdPessoa := qryWinsIDPESSOA.AsInteger;
                              iProposta := qryWinsPROPOSTA.AsInteger;
                              sGerar    := sGerar + chr(13)+' - O.C. Nº : '+ IntToStr(qryOCNUMOC.AsInteger);
                              // Gera o primeiro Nº da OC e ultimo da Nº da OC
                              NumOCFim := qryOCNUMOC.AsInteger;
                           End;
                        //--------------------------------------------------------------------------------------
                        // Verifica se existem reservas orçamentárias para virar compromisso
                        //--------------------------------------------------------------------------------------
                        iIdCompromisso := 0;
                        qrySCIOC.Close;
                        qrySCIOC.ParamByName('pCODPROCESSO').AsFloat := CodProc;
                        qrySCIOC.ParamByName('pIDPROCXART').AsFloat  := qryWinsIDPROCXART.AsFloat;
                        qrySCIOC.Open;
                        //
                        If Not qrySCIOC.IsEmpty Then
                           Begin
                              For y := 0 to 100 do
                                 iOrcament[y] := 0;
                              y := 0;
                               qrySCIOC.First;
                               While Not qrySCIOC.EOF Do
                                  Begin
                                     iNumReserva := OrcamentoBack.BuscaIdNumReserva(qrySCIOCIDRESERVAORCAMEN.AsInteger,0,True);
                                     If iNumReserva < 0 Then
                                        Abort;
                                     qryTestaReservaOrc.Close;
                                     qryTestaReservaOrc.ParamByName('IDRESERVAORCAMEN').AsInteger := iNumReserva;
                                     qryTestaReservaOrc.Open;
                                     If qryTestaReservaOrc.IsEmpty Then
                                        Begin
                                           iOrcament[y] := iNumReserva;
                                           Inc(y);
                                        End;
                                     qrySCIOC.Next;
                                 End;
                              iNumCompromisso := OrcamentoBack.CriaCompromisso(DateToStr(Date),(qryWinsVALOR.AsFloat*qryWinsQTDEOC.AsFloat),'',Sistema.idModulo,iOrcament,True,True);
                              If iNumCompromisso < 0 Then
                                 Abort;
                              iIdCompromisso := OrcamentoBack.BuscaIdNumReserva(0,iNumCompromisso,True);
                              If iIdCompromisso < 0 Then
                                 Abort;
                           End;
                        //--------------------------------------------------------------------------------------
                        // Grava os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        qryItemOC.Append;
                        qryItemOCNUMOC.AsFloat             := qryOCNUMOC.AsInteger;
                        qryItemOCIDITEMOC.AsFloat          := LeUltRegistro(nil,'ITEMOC');
                        qryItemOCCODARTIGO.AsString        := qryWinsCODARTIGO.AsString;
                        qryItemOCCODGRUPOPROD.AsString     := qryWinsCODGRUPOPROD.AsString;
                        qryItemOCCODMEDIDA.AsString        := qryWinsCODMEDIDA.AsString;
                        qryItemOCQTDEPEDIDA.AsFloat        := qryWinsQTDEOC.AsFloat;

                        If (qryWinsIDPRODVARI.IsNull) Or (qryWinsIDPRODVARI.AsInteger <= 0) Then
                           qryItemOCIDPRODVARI.Clear
                        Else
                           qryItemOCIDPRODVARI.AsInteger   := qryWinsIDPRODVARI.AsInteger;

                        qryItemOCOBSITEMOC.AsString        := qryWinsOBS.AsString;
                        qryItemOCVALORUN.AsString          := qryWinsVALOR.AsString;
                        qryItemOCFLGITEMATENDIDO.AsString  := 'F';

                        If iIdCompromisso = 0 Then
                           qryItemOCIDRESERVAORCAMEN.Clear
                        Else
                           qryItemOCIDRESERVAORCAMEN.AsInteger := iIdCompromisso;

                        If Modulo.sFlgObsSCIOC = 'S' Then
                           qryItemOCOBSITEMOC.AsString := qryWinsOBSITEMSOLIC.AsString
                        Else
                           qryItemOCOBSITEMOC.Clear;

                        qryItemOC.Post;

                        rValorOC:=rValorOC+(qryItemOCQTDEPEDIDA.AsFloat*qryItemOCVALORUN.AsFloat);
                        //--------------------------------------------------------------------------------------
                        // Grava os prazos de Entrega para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        qryWinEnt.Close;
                        qryWinEnt.ParamByName('pCODPROCESSO').AsInteger := qryWinsCODPROCESSO.AsInteger;
                        qryWinEnt.ParamByName('pIDFORCLI').AsInteger    := qryWinsIDFORCLI.AsInteger;
                        qryWinEnt.ParamByName('pIDPROCXART').AsInteger  := qryWinsIDPROCXART.AsInteger;
                        qryWinEnt.ParamByName('pPROPOSTA').AsInteger    := qryWinsPROPOSTA.AsInteger;
                        qryWinEnt.Open;

                        // Verifica se a Cotação possui prazo de Entrega
                        If qryWinEnt.IsEmpty Then
                           Begin
                              MsgDlg('OC não possui Prazo de Entrega. Proibido gerar OC.'+Char(13)+
                                      'Fornecedor : ' + qryWinsRAZAOSOCIAL.AsString +Char(13)+
                                      'Artigo     : ' + qryWinsDESCPROD.AsString,'Erro',mtError,[mbOk],0);
                              Abort;
                           End;
                        qryWinEnt.First;
                        x := 0;
                        While Not qryWinEnt.EOF Do
                           Begin
                              Inc( x );
                              qryPrazoEntOC.Append;
                              qryPrazoEntOCIDITEMOC.AsFloat         := qryItemOCIDITEMOC.AsFloat;
                              qryPrazoEntOCPARCELAENTREGA.AsInteger := x;
                              qryPrazoEntOCPRAZOENTREGA.AsInteger   := qryWinEntPRAZOENT.AsInteger;
                              qryPrazoEntOCQTDEENTREGA.AsFloat      := (qryWinEntQTDEENT.AsFloat*qryWinsQTDEOC.AsFloat)/qryWinEntQTDEFORNECIDA.AsFloat;
                              qryPrazoEntOCPERIODOPRAZO.AsString    := qryWinEntPERIODOPRAZO.AsString;
                              qryPrazoEntOCDATAENTREGA.AsDateTime   := qryWinEntDATAENT.AsDateTime;
                              qryPrazoEntOC.Post;
                              qryWinEnt.Next;
                           End;
                        //--------------------------------------------------------------------------------------
                        // Grava os prazos de Pagamento para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        qryWinPag.Close;
                        qryWinPag.ParamByName('pCODPROCESSO').AsInteger := qryWinsCODPROCESSO.AsInteger;
                        qryWinPag.ParamByName('pIDFORCLI').AsInteger    := qryWinsIDFORCLI.AsInteger;
                        qryWinPag.ParamByName('pIDPROCXART').AsInteger  := qryWinsIDPROCXART.AsInteger;
                        qryWinPag.ParamByName('pPROPOSTA').AsInteger    := qryWinsPROPOSTA.AsInteger;
                        qryWinPag.Open;
                        // Verifica se a Cotação possui prazo de Pagamento
                        If qryWinPag.IsEmpty Then
                           Begin
                              MsgDlg('OC não possui Prazo de Pagamento. Proibido gerar OC.'+Char(13)+
                                      'Fornecedor : ' + qryWinsRAZAOSOCIAL.AsString +Char(13)+
                                      'Artigo     : ' + qryWinsDESCPROD.AsString,'Erro',mtError,[mbOk],0);
                              Abort;
                           End;
                        qryWinPag.First;
                        x := 0;
                        While Not qryWinPag.EOF Do
                           Begin
                              Inc( x );
                              qryPrazoPagOC.Append;
                              qryPrazoPagOCIDITEMOC.AsFloat       := qryItemOCIDITEMOC.AsFloat;
                              qryPrazoPagOCPARCELAPGTO.AsInteger  := x;
                              qryPrazoPagOCPRAZOPGTO.AsInteger    := qryWinPagPRAZOPGTO.AsInteger;
                              qryPrazoPagOCPERIODOPRAZO.AsString  := qryWinPagPERIODOPRAZO.AsString;
                              qryPrazoPagOCPERCPAGTO.AsFloat      := qryWinPagPERCENT.AsFloat;
                              qryPrazoPagOCDATAPAGTO.AsDateTime   := qryWinPagDATAPGTO.AsDateTime;
                              qryPrazoPagOC.Post;
                              qryWinPag.Next;
                           End;
                        //--------------------------------------------------------------------------------------
                        // Grava os custos Agregados da cotação  para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        qryWinAgreg.Close;
                        qryWinAgreg.ParamByName('pCODPROCESSO').AsInteger := qryWinsCODPROCESSO.AsInteger;
                        qryWinAgreg.ParamByName('pIDFORCLI').AsInteger    := qryWinsIDFORCLI.AsInteger;
                        qryWinAgreg.ParamByName('pIDPROCXART').AsInteger  := qryWinsIDPROCXART.AsInteger;
                        qryWinAgreg.ParamByName('pPROPOSTA').AsInteger    := qryWinsPROPOSTA.AsInteger;
                        qryWinAgreg.Open;
                        qryWinAgreg.First;
                        While Not qryWinAgreg.EOF Do
                           Begin
                              qryAgregItemOC.Append;
                              qryAgregItemOCIDAGREGITEMOC.AsFloat      := LeUltRegistro(nil,'AGREGITEMOC');
                              qryAgregItemOCIDITEMOC.AsFloat           := qryItemOCIDITEMOC.AsFloat;
                              qryAgregItemOCCODTIPOCUSTAGREG.AsInteger := qryWinAgregCODTIPOCUSTAGREG.AsInteger;
                              qryAgregItemOCALIQUOTA.AsFloat           := qryWinAgregPERCENT.AsFloat;
                              qryAgregItemOCBASECALCULO.AsFloat        := qryWinAgregBASECALCULO.AsFloat;
                              qryAgregItemOCVLRAGREGITEM.AsFloat       := qryWinAgregVALOR.AsFloat;
                              qryAgregItemOC.Post;
                              StrPcopy(cAux,qryWinAgregCODTRATFISCE.AsString);
                              If cAux[0] in ['1','3','4','5','9','A'] Then
                                 rValorOC := rValorOC + qryAgregItemOCVLRAGREGITEM.AsFloat
                              Else
                                 If cAux[0] = '6' Then
                                    rValorOC := rValorOC - qryAgregItemOCVLRAGREGITEM.AsFloat;
                              qryWinAgreg.Next;
                           End;
                        //--------------------------------------------------------------------------------------
                        // Grava os custos Agregados da cotação  para os Itens da O.C.
                        //--------------------------------------------------------------------------------------
                        qryWinSCItemOC.Close;
                        qryWinSCItemOC.ParamByName('pCODPROCESSO').AsInteger := qryWinsCODPROCESSO.AsInteger;
                        qryWinSCItemOC.ParamByName('pIDFORCLI').AsInteger    := qryWinsIDFORCLI.AsInteger;
                        qryWinSCItemOC.ParamByName('pIDPROCXART').AsInteger  := qryWinsIDPROCXART.AsInteger;
                        qryWinSCItemOC.ParamByName('pPROPOSTA').AsInteger    := qryWinsPROPOSTA.AsInteger;
                        qryWinSCItemOC.Open;
                        qryWinSCItemOC.First;
                        While Not qryWinSCItemOC.EOF Do
                           Begin
                              qrySCItemOC.Append;
                              qrySCItemOCIDITEMOC.AsFloat     := qryItemOCIDITEMOC.AsFloat;
                              qrySCItemOCNUMSOLCOMPRA.AsFloat := qryWinSCItemOCNUMSOLCOMPRA.AsFloat;
                              qrySCItemOCIDITEMSOLI.AsFloat   := qryWinSCItemOCIDITEMSOLI.AsFloat;
                              qrySCItemOC.Post;
                              qryWinSCItemOC.Next;
                           End;
                        //
                        qryOC.Edit;
                        qryOCVALOROC.AsFloat := qryOCVALOROC.AsFloat + rValorOC;
                        qryOC.Post;
                        //
                        qryWins.Edit;
                        qryWinsIDITEMOC.AsFloat := qryItemOCIDITEMOC.AsFloat;
                        qryWins.Post;
                        qryWins.Next;
                     End;
                  qryPROC.Edit;
                  qryPROCSTATUS.AsString := 'F';
                  qryPROC.Post;
                  If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) Then
                     Begin
                        qryOC.First;
                        While not qryOC.EOF do
                           Begin
                              Rad.TipoProcesso    := iIdTipoProcesso;
                              Rad.IdPessoa        := Sistema.IdEmpresa;
                              Rad.Valor           := DtmCompras.qryOCVALOROC.AsFloat;
                              Rad.OBS             := 'O.C. Número : '+IntToStr(DtmCompras.qryOCNUMOC.AsInteger);
                              //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
                              //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
                              //Rad.CodGrupoProd    := sGrupoProd;
                              qryOC.Edit;
                              qryOCIDPROCESSO.AsInteger := Rad.IniciarProcesso;
                              qryOC.Post;
                              //
                              if qryOCIDPROCESSO.AsInteger < 0 Then
                                 Begin
                                    MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                                    Abort;
                                 End;
                              qryOC.Next;
                           End;
                     End;
                  DtmCompras.qryOC.ApplyUpdates;
                  DtmCompras.qryOC.CommitUpdates;
                  DtmCompras.qryItemOC.ApplyUpdates;
                  DtmCompras.qryItemOC.CommitUpdates;
                  DtmCompras.qryPrazoEntOC.ApplyUpdates;
                  DtmCompras.qryPrazoEntOC.CommitUpdates;
                  DtmCompras.qryPrazoPagOC.ApplyUpdates;
                  DtmCompras.qryPrazoPagOC.CommitUpdates;
                  DtmCompras.qryAgregItemOC.ApplyUpdates;
                  DtmCompras.qryAgregItemOC.CommitUpdates;
                  DtmCompras.qrySCItemOC.ApplyUpdates;
                  DtmCompras.qrySCItemOC.CommitUpdates;
                  qryWins.ApplyUpdates;
                  qryWins.CommitUpdates;
                  qryProc.ApplyUpdates;
                  qryProc.CommitUpdates;
                  DtmCOmpras.LancCap;
                  CommitTransacao;
                  MsgDlg(sGerar,'Informação',mtInformation,[mbOk],0);
               Except
                  On E : Exception Do
                     Begin
                        RollBackTransacao;
                        MsgDlg('Erro ao tentar gerar O.C.'+ Chr(13)+ E.MEssage,'Erro',mtError,[mbOk],0);
                     End;
               End;
            End
         Else
           MsgDlg('Erro ao tentar gerar O.C. Não foi possível determinar os vencedores !','Erro',mtError,[mbOk],0);
      End;
   If (Modulo.ModeloImpOC > 0) And (MsgDlg('Deseja imprimir a(s) O.C.(s) gerada(s) ?','Confirmação',mtConfirmation,[mbYes,mbNo],0)= mrYes)
   Then
       ImpOC(numOCIni,NumOCFim);
End;

procedure TFrmSumarioCot.btnGeraOCClick(Sender: TObject);
begin
  inherited;
  if VerifOC( qryProcCODPROCESSO.AsInteger ) Then
     Begin
        btnConfSel.Enabled := False;
        btnGeraOC.Enabled  := False;                  
        GeraOC( qryProcCODPROCESSO.AsInteger );
        LbProc.Caption := '';
        Sel(-1);
     End;
end;

procedure TFrmSumarioCot.FormPaint(Sender: TObject);
begin
  inherited;
  If Modulo.sFormSumario = 'S' then
     FrmSumarioCot.Caption := 'Sumário de Cotação'
  else
     FrmSumarioCot.Caption := 'Consulta Sumário de Cotação';
  Application.ProcessMessages;
end;

{
=============================================================================================
 REGRAS DE CALCULO DO SUMÁRIO DE COTAÇÃO
=============================================================================================
  1) Para preços nulos ou igual a zero gravar nulo no PRECOAVALORPRES
  2) Adicionar ao PRECO todos os encargos (somando ou diminuindo)
  3) Para valores em outra moeda, converter para real  (Valitem)
  4) Para trazer a valor presente, utilizar a seguinte formula com
     os prazos.
     4.1) Fazer um while na query prazos
     4.2) VlPresente := 0 => Valor Presente
     4.3) VlPresente := VlPresente + ((Valitem * (PERCENT/100.00)) / ((1+(TXJUROS/100.00)) ** (PRAZOPGTO/30)))
}
procedure TFrmSumarioCot.FormActivate(Sender: TObject);
begin
  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);

end;

procedure TFrmSumarioCot.ImpOC(NumI,NumF : Int64);
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
         1 : DtmRelCompras.ppOC.Print;
         2 : DtmRelCompras.ppOCM1.Print;
         3 : DtmRelCompras.ppOCM2.Print;
      End;
   Finally
      FrmParamImpOC.Free;
   End;
end;

end.









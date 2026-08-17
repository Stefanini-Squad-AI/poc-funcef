//******************************************************************************
// Rotina     : Busca da Transferencia de Planos de Direitos (
// SOL        :
// Kintana    :
// Data       : 01/11/2010
// Responsável: Adilson Filho
// Descrição  : Implementação do Filtro Para o Relátório
//              da Transferencia de Planos de Direitos
//******************************************************************************
Unit FConsTransPlanosDireitosMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelarRelInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
   Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
   CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db, uCmSqlParams, DBClient,
   uCMClientDataSet, uCtrlPadroes, uCtrlRendaVariavel,
   uMensErro, uCtrlInvestimento, uInvestimento, FPreview, UDiasUteisInv,
   DBTables;

Type
   TFrmConsTransPlanosDireitosMT = Class(TfrmOkCancelarRelInv)
      grdConsulta: TwwDBGrid;
      edDataIni: TCMDateTimePicker;
      Label8: TLabel;
      lblPlanoPatroOrigem: TLabel;
      dblkCarteira: TwwDBLookupCombo;
      lblCarteira: TLabel;
      dblkPlanPatroO: TwwDBLookupCombo;
      dblkTipoOperacao: TwwDBLookupCombo;
      lblInvestimento: TLabel;
      edDataFim: TCMDateTimePicker;
      Label1: TLabel;
      CdsConsTransPlanosDireitosMT: TCMClientDataSet;
      sprConsTransPlanosDireitosMT: TCMSqlParams;
      dsConsTransPlanosDireitosMT: TDataSource;
      cdsCarteira: TCMClientDataSet;
      cdsTipoOperacao: TCMClientDataSet;
      Label2: TLabel;
      cdsPlanoPatroO: TCMClientDataSet;
      CdsConsTransPlanosDireitosMTIDOPERACAODIREITO: TFloatField;
      CdsConsTransPlanosDireitosMTQUANTIDADEANTERIORDAORIGEM: TFloatField;
      CdsConsTransPlanosDireitosMTVALORANTERIORDAORIGEM: TFloatField;
      CdsConsTransPlanosDireitosMTDATADAOPERACAO: TDateTimeField;
      CdsConsTransPlanosDireitosMTBOLETA: TStringField;
      CdsConsTransPlanosDireitosMTIDBOLETA: TStringField;
      CdsConsTransPlanosDireitosMTDATATRANSF: TDateTimeField;
      CdsConsTransPlanosDireitosMTQTDTRANSF: TFloatField;
      CdsConsTransPlanosDireitosMTVLRTRANSF: TFloatField;
      CdsConsTransPlanosDireitosMTQTDATUALORIG: TFloatField;
      CdsConsTransPlanosDireitosMTVLRATUALORIG: TFloatField;
      CdsConsTransPlanosDireitosMTQTDDEST: TFloatField;
      CdsConsTransPlanosDireitosMTVLRDEST: TFloatField;
      CdsConsTransPlanosDireitosMTDATADESTINO: TDateTimeField;
      CdsConsTransPlanosDireitosMTVALORATUALDESTINO: TFloatField;
      CdsConsTransPlanosDireitosMTBOLETATRANSF: TStringField;
      CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD: TStringField;
      CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD_1: TStringField;
      CdsConsTransPlanosDireitosMTDESCTIPOOPERACAOGRD: TStringField;
      CdsConsTransPlanosDireitosMTPLANOORIGEMGRD: TStringField;
      CdsConsTransPlanosDireitosMTPU: TFloatField;
      CdsConsTransPlanosDireitosMTPLANODESTINOGRD: TStringField;
      CdsConsTransPlanosDireitosMTPERCENTUAL: TFloatField;
      CdsConsTransPlanosDireitosMTDESCINVESTIMENTO: TStringField;
    CdsConsTransPlanosDireitosMTVALORREMUNERACAO: TFloatField;
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure grdConsultaCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure grdConsultaTopRowChanged(Sender: TObject);
      Procedure bt_ImprimeClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
   Private
      CtrlInvestimento: TCtrlInvestimento;
      CtrlRendaVariavel: TCtrlRendaVariavel;
      //RelConsTransPlanosDireitosRV: TRelConsTransPlanosDireitosRV;


   Public
      { Public declarations }

   End;

Var
   FrmConsTransPlanosDireitosMT: TFrmConsTransPlanosDireitosMT;
   iCarteira, iPlanPrevOrig, iPlanPrevDest, iTipoOperacao: Integer;

Var dDataIni, dDataFim: TDateTime;
Implementation

uses RConsTransPlanosDireitosRV, RConsTransPlanosRV;


{$R *.DFM}

Procedure TFrmConsTransPlanosDireitosMT.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Inherited;
   FreeAndNil( RelConsTransPlanosDireitosRV);
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
End;

Procedure TFrmConsTransPlanosDireitosMT.FormCreate(Sender: TObject);
Begin
   Inherited;
   RelConsTransPlanosDireitosRV := TRelConsTransPlanosDireitosRV.Create(Self);
   CtrlInvestimento := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);
   cdsCarteira.Data := CtrlInvestimento.ListCarteira(2, -1, 0);
   cdsTipoOperacao.Data := CtrlInvestimento.ListTipoOperacao(2, -1, -1);
   //AL_1
   cdsPlanoPatroO.Data := CtrlInvestimento.ListPlanoPatro;
End;

Procedure TFrmConsTransPlanosDireitosMT.grdConsultaCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TFrmConsTransPlanosDireitosMT.bbtnConfirmarClick(
   Sender: TObject);

Begin
   Inherited;

   If Trim(dblkCarteira.Text) = '' Then
      iCarteira := -1
   Else
      iCarteira := cdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

   If Trim(dblkPlanPatroO.Text) = '' Then
      iPlanPrevOrig := -1
   Else
      iPlanPrevOrig := cdsPlanoPatroO.FieldByName('IDPLANPREVCTBPATR').AsInteger;

   If Trim(dblkTipoOperacao.Text) = '' Then
      iTipoOperacao := -1
   Else
      iTipoOperacao := cdsTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;

   If Trim(edDataIni.Text) = '' Then
      Begin
         MsgDlg('Informe a Data Início.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         If edDataIni.CanFocus Then
            edDataIni.SetFocus;
         Exit;
      End;

   If Trim(edDataIni.Text) <> '' Then
      Begin
         dDataIni := edDataIni.DateTime;
      End;

   If Trim(edDataFim.Text) = '' Then
      Begin
         MsgDlg('Informe a Data Fim.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         If edDataFim.CanFocus Then
            edDataFim.SetFocus;
         Exit;
      End;

   If Trim(edDataFim.Text) <> '' Then
      Begin
         dDataFim := edDataFim.DateTime;
      End;

   CdsConsTransPlanosDireitosMT.Data := CtrlRendaVariavel.ListOperTrcPlanosDireitos(dDataIni, dDataFim,
      iTipoOperacao, iCarteira, iPlanPrevOrig);

   If CdsConsTransPlanosDireitosMT.IsEmpty Then
      bt_Imprime.Enabled := False
   Else
      bt_Imprime.Enabled := True;
End;

Procedure TFrmConsTransPlanosDireitosMT.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   CdsConsTransPlanosDireitosMT.Close;
   bt_Imprime.Enabled := False

End;

Procedure TFrmConsTransPlanosDireitosMT.grdConsultaTopRowChanged(
   Sender: TObject);
Begin
   Inherited;
   TwwDBGrid(Sender).Invalidate;
End;

Procedure TFrmConsTransPlanosDireitosMT.bt_ImprimeClick(Sender: TObject);
Begin

   Inherited;
   If Not CdsConsTransPlanosDireitosMT.IsEmpty Then
      Begin
      
         RelConsTransPlanosDireitosRV.CdsConsTransPlanosDireitosMT.Data := CdsConsTransPlanosDireitosMT.Data;

         RelConsTransPlanosDireitosRV.lblEmpresa.Caption := Investimentos.NomeEmpresa;
         RelConsTransPlanosDireitosRV.lblSistema.Caption := 'INVESTIMENTOS';

         TFrmPreview.CreateModalPreview(Application,
            RelConsTransPlanosDireitosRV.rptConsTransPlanosDireitosMT,
            RelConsTransPlanosDireitosRV.rptConsTransPlanosDireitosMT.PrinterSetup.DocumentName);
      End;
   RelConsTransPlanosDireitosRV.CdsConsTransPlanosDireitosMT.EmptyDataSet;
End;

Procedure TFrmConsTransPlanosDireitosMT.FormShow(Sender: TObject);
Begin
   Inherited;
   If CdsConsTransPlanosDireitosMT.IsEmpty Then
      bt_Imprime.Enabled := false;
End;

End.


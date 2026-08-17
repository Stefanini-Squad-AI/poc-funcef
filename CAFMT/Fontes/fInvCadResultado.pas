unit fInvCadResultado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, Grids, Wwdbigrd,
  Wwdbgrid, TB97, ComCtrls, ExtCtrls, Mask, DBCtrls, wwdblook,
  MontaSelect, wwdbedit, TB97Ctls, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmInvCadResultado = class(TfrmCadastroDetalhe)
    Label1: TLabel;
    btnBuscaMestre: TBitBtn;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    edDataFim: TCMDateTimePicker;
    ckbEncerrado: TCheckBox;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    qryLocalIDPESSOA: TFloatField;
    dsLocal: TwwDataSource;
    MSLocal: TMontaSelect;
    Label6: TLabel;
    dbeSelLocal: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    Label5: TLabel;
    cmbFlgSitFisica: TComboBox;
    dbeIdInventario: TwwDBEdit;
    qryInventBens: TwwQuery;
    dsInventBens: TwwDataSource;
    MSInventBens: TMontaSelect;
    Label7: TLabel;
    cmbFlgPlaca: TComboBox;
    qryPlacaIIB: TwwQuery;
    qryPlacaIIBIDINVENTARIOBENS: TFloatField;
    Panel2: TPanel;
    dbeDataInicio: TCMDateTimePicker;
    updInventBens: TUpdateSQL;
    btnMarcaOK: TSpeedButton;
    qryBuscaConj: TwwQuery;
    MSConjunto: TMontaSelect;
    qrySelConjunto: TwwQuery;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    dsSelConjunto: TwwDataSource;
    Label8: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    qryBuscaConjIDCONJUNTO: TFloatField;
    bbtnImportar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    Label2: TLabel;
    dbeResponsavel: TwwDBEdit;
    qryIDINVENTARIOBENS: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryIIBPLACA: TFloatField;
    qryIIBFLGPLACA: TFloatField;
    qryIIBLOCALATUAL: TFloatField;
    qryIIBCONJUNTOATUAL: TFloatField;
    qryIIBLOCALNOVO: TFloatField;
    qryIIBCONJUNTONOVO: TFloatField;
    qryIIBFLGSITFISICA: TFloatField;
    qryPLACA: TFloatField;
    qryIDBEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryInventBensIDINVENTARIOBENS: TFloatField;
    qryInventBensIDEMPRESA: TFloatField;
    qryInventBensIDRESPONSAVEL: TFloatField;
    qryInventBensDATAINILEVANT: TDateTimeField;
    qryInventBensDATAFIMLEVANT: TDateTimeField;
    qryInventBensSTATUS: TFloatField;
    qryInventBensNOMERESP: TStringField;
    qryParam: TwwQuery;
    qryParamCDPORTA: TFloatField;
    qryParamCDVELOC: TStringField;
    qryParamIDPESSOA: TFloatField;
    qryParamCOLETORDADOS: TFloatField;
    qryIIBIDBEM: TFloatField;
    qryDESBEM: TStringField;
    bbtnFillNotFound: TSpeedButton;
    //
    Procedure FazerConfirma; Override;
    //
    procedure btnBuscaMestreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ckbEncerradoClick(Sender: TObject);
    procedure edDataFimChange(Sender: TObject);
    procedure btnMarcaOKClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure cmbFlgPlacaChange(Sender: TObject);
    procedure cmbFlgPlacaExit(Sender: TObject);
    procedure bbtnImportarClick(Sender: TObject);
    procedure bbtnFillNotFoundClick(Sender: TObject);

  private
    { Private declarations }
    iSelConjunto : Integer;
    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
    bFlgColetor : Boolean;
    iTipoColetor : Integer;
  end;

var
  frmInvCadResultado: TfrmInvCadResultado;

implementation

{$R *.DFM}

uses uVerificaPreenchimento, uSistema, uMensErro, fCadConjunto, fInvColPDT3100,
     fInvColScwLucas7000, dAtivoFixo, fInvRegNaoEncontrados;

procedure TfrmInvCadResultado.FormCreate(Sender: TObject);
begin
   inherited;
   if not qry.Prepared then qry.Prepare;
   qryPlacaIIB.Prepare;
   qryLocal.Prepare;
   qryInventBens.Prepare;
   qrySelConjunto.Prepare;
   qryBuscaConj.Prepare;
   //-------------------------------------------------------------------------------------
   qryParam.Close;
   qryParam.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParam.Open;
   bFlgColetor  := not (qryParamCOLETORDADOS.AsInteger = 0);
   iTipoColetor := qryParamCOLETORDADOS.AsInteger;
   bbtnImportar.Visible := bFlgColetor;
   bbtnFillNotFound.Visible := bFlgColetor;
   btnMarcaOk.Visible := Not bFlgColetor;
   //-------------------------------------------------------------------------------------
   bbtnSelLocal.Enabled     := False;
   bbtnSelConjunto.Enabled  := False;
   bbtnGeraConjunto.Enabled := False;
end;
//========================================================================================
procedure TfrmInvCadResultado.FormShow(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   pnlControles.Enabled  := False;
   AtualizaBotoes;
   sbtnInserir.Enabled   := False;
   btnMarcaOk.Enabled    := False;
   bbtnFillNotFound.Enabled := False;
   bbtnImportar.Enabled  := False;
   bbtnSair.SetFocus;
end;
//========================================================================================
procedure TfrmInvCadResultado.btnBuscaMestreClick(Sender: TObject);
begin
   MSInventBens.Executar;
   Repaint;
   if (MSInventBens.RetornouValor) then
   begin
      Screen.Cursor := crHourGlass;
      //----------------------------------------------------------------------------------
      qryInventBens.Close;
      qryInventBens.Params[0].Value := MSInventBens.ValoresChave[0];
      qryInventBens.Params[1].Value := MSInventBens.ValoresChave[1];
      qryInventBens.Open;
      //----------------------------------------------------------------------------------
      if (qryInventBensSTATUS.AsInteger = 1) then
      begin
         ckbEncerrado.Checked := True;
         edDataFim.Text := qryInventBensDATAFIMLEVANT.AsString;
      end else
      begin
         ckbEncerrado.Checked := False;
         edDataFim.Text := '';
      end;
      //----------------------------------------------------------------------------------
      qry.Close;
      qry.Params[0].Value := qryInventBensIDINVENTARIOBENS.AsInteger;
      qry.Params[1].Value := qryInventBensIDEMPRESA.AsInteger;
      qry.Open;
      //----------------------------------------------------------------------------------
      if qry.IsEmpty then
      begin
         CmeCadastro.Operacao := opVazio;
      end else
      begin
         CmeCadastro.Operacao := opIdle;
      end;
      AtualizaBotoes;
      btnMarcaOk.Enabled    := True;
      bbtnFillNotFound.Enabled := True;
      bbtnImportar.Enabled  := True;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      dbGrd.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.sbtnInserirClick(Sender: TObject);
begin
   //-------------------------------------------------------------------------------------
   // IIBFLGPLACA
   //-------------------------------------------------------------------------------------
   // 0 - ...
   // 1 - Ok
   // 2 - Placa não Encontrada
   // 3 - Placa em Outro Local
   // 4 - Placa de Outro Local
   // 5 - Placa não Cadastrada
   //-------------------------------------------------------------------------------------
   CmeCadastro.Operacao := opInserir;
   AtualizaBotoes;
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      try
         qryPlacaIIB.Close;
         qryPlacaIIB.ParamByName('PIDINVENTARIOBENS').AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
         qryPlacaIIB.ParamByName('PIDEMPRESA').AsInteger := qryInventBensIDEMPRESA.AsInteger;
         qryPlacaIIB.ParamByName('PPLACA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[2]);
         qryPlacaIIB.Open;
         if (qryPlacaIIB.IsEmpty) then
         begin
            qry.Append;
            qryIDPESSOA.AsInteger         := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
            qryIDBEM.AsInteger            := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
            qryPLACA.AsInteger            := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[2]);
            qryDESBEM.AsString            := dtmAtivoFixo.MSBem.ValoresChave[3];
            qryIDINVENTARIOBENS.AsInteger := qryInventBensIDINVENTARIOBENS.AsInteger;
            qryIDEMPRESA.AsInteger        := qryInventBensIDEMPRESA.AsInteger;
            qryIIBPLACA.AsFloat           := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[2]);
            qryIIBIDBEM.AsInteger         := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
            qryIIBFLGPLACA.AsInteger      := 4;
            qryIIBLOCALATUAL.AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[4]);
            qryIIBCONJUNTOATUAL.AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[5]);
            qryIIBFLGSITFISICA.AsInteger  := 0;
            qry.ApplyUpdates;
            //----------------------------------------------------------------------------
            qry.Prior;
            qry.Next;
         end else
         begin
            MsgDlg('Placa já incluída neste Levantamento de Inventário', 'Atenção',
            mtError, [mbOk], 0);
         end;
      except
         Raise;
         Repaint;
      end;
   end;
   //-------------------------------------------------------------------------------------
   CmeCadastro.Operacao := opIdle;
   AtualizaBotoes;
end;
//========================================================================================
procedure TfrmInvCadResultado.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   bbtnSelLocal.Enabled     := False;
   bbtnSelConjunto.Enabled  := False;
   bbtnGeraConjunto.Enabled := False;
   btnMarcaOk.Enabled       := False;
   bbtnFillNotFound.Enabled := False;
   cmbFlgPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmInvCadResultado.btnMarcaOKClick(Sender: TObject);
begin
   inherited;
   if (MsgDlg('Confirma a marcação de todos os bens do levantamento como OK',
              'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
      qry.DisableControls;
      qry.First;
      while not qry.EOF do
      begin
         if ((qryIIBFLGPLACA.IsNull) or (qryIIBFLGPLACA.AsInteger = 0)) then
         begin
            qry.Edit;
            qryIIBFLGPLACA.AsInteger := 1;
            qry.Post;
         end;
         qry.Next;
      end;
      qry.ApplyUpdates;
      qry.First;
      qry.EnableControls;
   end;
   btnMarcaOK.Down := False;
end;
//========================================================================================
function TfrmInvCadResultado.VerificaPreenchimento: boolean;
begin
	 Result := False;
   try
      if qryIDINVENTARIOBENS.isNULL then
         Raise EValidacao.CreateVal('É necessário selecionar o Inventário!', btnBuscaMestre);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then
            MsgDlg(ev.message, 'Atenção', mtWarning, [mbOk], 0);
         Application.ProcessMessages;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         exit;
      end;
   end;
   Result := True;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then
      inherited;
   //-------------------------------------------------------------------------------------
   btnMarcaOk.Enabled       := True;
   bbtnFillNotFound.Enabled := True;
   bbtnSelLocal.Enabled     := False;
   bbtnSelConjunto.Enabled  := False;
   bbtnGeraConjunto.Enabled := False;
   dbGrd.SetFocus;
end;
//========================================================================================
procedure TfrmInvCadResultado.FazerConfirma;
begin
   //-------------------------------------------------------------------------------------
   // IIBFLGPLACA
   //-------------------------------------------------------------------------------------
   // 0 - ...
   // 1 - Ok
   // 2 - Placa não Encontrada
   // 3 - Placa em Outro Local
   // 4 - Placa de Outro Local
   // 5 - Placa não Cadastrada
   //-------------------------------------------------------------------------------------
   case CmeCadastro.Operacao of
      opAlterar:
      begin
         try
            if ((cmbFlgPlaca.Text <> '') and (cmbFlgPlaca.Text <> '...')) then
            begin
               qryIIBFLGPLACA.AsInteger := cmbFlgPlaca.ItemIndex;
               //-------------------------------------------------------------------------
               if ((cmbFlgPlaca.ItemIndex = 1) or (cmbFlgPlaca.ItemIndex = 2) or
                   (cmbFlgPlaca.ItemIndex = 5)) then
               begin
                  qryIIBLOCALNOVO.Clear;
                  qryIIBCONJUNTONOVO.Clear;
               end;
               //-------------------------------------------------------------------------
               if ((cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4)) and
                  (dbeSelLocal.Text <> '') then
               begin
                  qryIIBLOCALNOVO.AsInteger := qryLocalIDLOCALIZACAO.AsInteger;
                  if (dbeConjunto.Text <> '') then
                     qryIIBCONJUNTONOVO.AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger
                  else
                     qryIIBCONJUNTONOVO.Clear;
               end else
               begin
                  qryIIBLOCALNOVO.Clear;
                  qryIIBCONJUNTONOVO.Clear;
               end;
               //-------------------------------------------------------------------------
               if (cmbFlgSitFisica.Text <> '') then
               begin
                  qryIIBFLGSITFISICA.AsInteger := cmbFlgSitFisica.ItemIndex;
               end else
               begin
                  qryIIBFLGSITFISICA.AsInteger := 0;
               end;
            end else
            begin
               qryIIBFLGPLACA.AsInteger := 0;
               qryIIBLOCALNOVO.Clear;
               qryIIBCONJUNTONOVO.Clear;
               qryIIBFLGSITFISICA.AsInteger := 0;
            end;
            qry.ApplyUpdates;
         except
            Application.ProcessMessages;
         end;
      end;
      //----------------------------------------------------------------------------------
      opApagar:
      begin
         try
            qry.ApplyUpdates;
         except
            Application.ProcessMessages;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   btnMarcaOk.Enabled := True;
   bbtnFillNotFound.Enabled := True;
   dbGrd.SetFocus;
end;
//========================================================================================
procedure TfrmInvCadResultado.qryAfterScroll(DataSet: TDataSet);
begin
   inherited;
   cmbFlgPlaca.ItemIndex := qryIIBFLGPLACA.AsInteger;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   if not (qryIIBLOCALNOVO.IsNull) then
   begin
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryIIBLOCALNOVO.AsInteger;
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryLocal.Open;
   end;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   if not (qryIIBCONJUNTONOVO.IsNull) then
   begin
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryIIBCONJUNTONOVO.AsInteger;
      qrySelConjunto.Open;
   end;
   //-------------------------------------------------------------------------------------
   cmbFlgSitFisica.ItemIndex := qryIIBFLGSITFISICA.AsInteger;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSLocal.Executar;
   //-------------------------------------------------------------------------------------
   Invalidate;
   Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   qryBuscaConj.Close;
   qrySelConjunto.Close;
   if (MSLocal.ValoresChave.Count > 0) and (MSLocal.ValoresChave[0] <> '') then
   begin
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryBuscaConj.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryBuscaConj.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryBuscaConj.Open;
      if (qryBuscaConj.RecordCount = 1) then
      begin
         qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryBuscaConjIDCONJUNTO.AsInteger;
         qrySelConjunto.Open;
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvCadResultado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryPlacaIIB.Close;
   qryLocal.Close;
   qryInventBens.Close;
   qrySelConjunto.Close;
   qryBuscaConj.Close;
   //-------------------------------------------------------------------------------------
   qry.UnPrepare;
   qryPlacaIIB.UnPrepare;
   qryLocal.UnPrepare;
   qryInventBens.UnPrepare;
   qrySelConjunto.UnPrepare;
   qryBuscaConj.UnPrepare;
end;
//========================================================================================
procedure TfrmInvCadResultado.ckbEncerradoClick(Sender: TObject);
begin
   inherited;
   if not (qryInventBens.State = dsEdit) then
   begin
      qryInventBens.Edit;
      if (ckbEncerrado.Checked) then
      begin
         qryInventBensSTATUS.AsInteger := 1;
         edDataFim.Date := Date;
      end else
      begin
         qryInventBensSTATUS.AsInteger := 0;
         edDataFim.Text := '';
      end;
      qryInventBensDATAFIMLEVANT.AsString := edDataFim.Text;
      qryInventBens.Post;
      qryInventBens.ApplyUpdates;
      //----------------------------------------------------------------------------------
      edDataFim.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.edDataFimChange(Sender: TObject);
begin
   inherited;
   if not (qryInventBens.State = dsEdit) then
   begin
      qryInventBens.Edit;
      if (edDataFim.Text <> '') then
      begin
         ckbEncerrado.Checked := True;
         qryInventBensSTATUS.AsInteger := 1;
         qryInventBensDATAFIMLEVANT.AsString := edDataFim.Text;
      end else
      begin
         ckbEncerrado.Checked := False;
         qryInventBensSTATUS.AsInteger := 0;
         qryInventBensDATAFIMLEVANT.Clear;
      end;
      qryInventBens.Post;
      qryInventBens.ApplyUpdates;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Códigos de iibFlgPlaca
   //-------------------------------------------------------------------------------------
   // 0 - Resultado não informado
   // 1 - Ok
   // 2 - Placa não encontrada
   // 3 - Placa EM outro Local
   // 4 - Placa DE outro Local
   // 5 - Placa não cadastrada
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crSQLWait;
   if (cmbFlgPlaca.ItemIndex >= 2) then
   begin
      MSConjunto.Filtro.Strings[2] := 'CONJUNTO.IDLOCALIZACAO = ' +
                                      qryLocalIDLOCALIZACAO.AsString;
   end;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSConjunto.ValoresChave.Count > 0) and (MSConjunto.ValoresChave[0] <> '') then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      iSelConjunto := qrySelConjuntoIDCONJUNTO.AsInteger;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.SetFocus;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnGeraConjuntoClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmCadConjunto,frmCadConjunto);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   if not frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').IsNull then
   begin
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := frmCadConjunto.qryUltConj.FieldByname('IDCONJUNTO').asInteger;
      qrySelConjunto.Open;
   end;   
   //-------------------------------------------------------------------------------------
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.SetFocus;
end;
//========================================================================================
procedure TfrmInvCadResultado.cmbFlgPlacaChange(Sender: TObject);
begin
   inherited;
   if ((cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4)) then
   begin
      bbtnSelLocal.Enabled     := True;
      bbtnSelConjunto.Enabled  := True;
      bbtnGeraConjunto.Enabled := True;
   end else
   begin
      bbtnSelLocal.Enabled     := False;
      bbtnSelConjunto.Enabled  := False;
      bbtnGeraConjunto.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.cmbFlgPlacaExit(Sender: TObject);
begin
   inherited;
   if ((cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4)) then
   begin
      bbtnSelLocal.Enabled     := True;
      bbtnSelConjunto.Enabled  := True;
      bbtnGeraConjunto.Enabled := True;
   end else
   begin
      bbtnSelLocal.Enabled     := False;
      bbtnSelConjunto.Enabled  := False;
      bbtnGeraConjunto.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnImportarClick(Sender: TObject);
begin
   inherited;
   if iTipoColetor = 1 then
   begin
      Application.CreateForm(TfrmInvColPDT3100,frmInvColPDT3100);
      frmInvColPDT3100.FormStyle          := FsNormal;
      frmInvColPDT3100.Visible            := False;
      frmInvColPDT3100.rdgpOper.ItemIndex := 1;
      frmInvColPDT3100.ShowModal;
      frmInvColPDT3100.Release;
   end else
   if iTipoColetor = 2 then
   begin
      Application.CreateForm(TfrmInvColScwLucas7000,frmInvColScwLucas7000);
      frmInvColScwLucas7000.FormStyle          := FsNormal;
      frmInvColScwLucas7000.Visible            := False;
      frmInvColScwLucas7000.rdgpOper.ItemIndex := 1;
      frmInvColScwLucas7000.ShowModal;
      frmInvColScwLucas7000.Release;
   end;
   //-------------------------------------------------------------------------------------
   qry.Close;
   qry.Params[0].Value := qryInventBensIDINVENTARIOBENS.AsInteger;
   qry.Params[1].Value := qryInventBensIDEMPRESA.AsInteger;
   qry.Open;
end;
//========================================================================================
procedure TfrmInvCadResultado.bbtnFillNotFoundClick(Sender: TObject);
Var
   iLocal, iConjunto, iPessoa : Integer;

begin
   inherited;
   Application.CreateForm(TfrmInvRegNaoEncontrados,frmInvRegNaoEncontrados);
   frmInvRegNaoEncontrados.FormStyle := FsNormal;
   frmInvRegNaoEncontrados.Visible   := False;
   frmInvRegNaoEncontrados.ShowModal;
   //-------------------------------------------------------------------------------------
   iPessoa   := frmInvRegNaoEncontrados.iPessoa;
   iLocal    := frmInvRegNaoEncontrados.iLocal;
   iConjunto := frmInvRegNaoEncontrados.iConjunto;
   frmInvRegNaoEncontrados.Release;
   //-------------------------------------------------------------------------------------
   if (iPessoa > 0) and (iLocal > 0) and (iConjunto > 0) then
   begin
      if (MsgDlg('Confirma a marcação de todos os bens não localizados '+#13+
                 'na Localização / Conjunto selecionado',
                 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
         qry.DisableControls;
         qry.First;
         while not qry.EOF do
         begin
            if (qryIIBFLGPLACA.AsInteger = 2) then
            begin
               qry.Edit;
               qryIIBLOCALNOVO.AsInteger    := iLocal;
               qryIIBCONJUNTONOVO.AsInteger := iConjunto;
               qry.Post;
            end;
            qry.Next;
         end;
         qry.ApplyUpdates;
         qry.First;
         qry.EnableControls;
      end;
   end;
   bbtnFillNotFound.Down := False;
   Application.ProcessMessages;
end;

end.

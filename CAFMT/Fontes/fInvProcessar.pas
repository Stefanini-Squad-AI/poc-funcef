unit fInvProcessar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, DBTables,
  Wwdatsrc, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbedit, Mask, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmInvProcessar = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    pnlDetalhe: TPanel;
    qryInventBens: TwwQuery;
    dsInventBens: TwwDataSource;
    updInventBens: TUpdateSQL;
    GroupBox1: TGroupBox;
    edDataFim: TCMDateTimePicker;
    ckbEncerrado: TCheckBox;
    Panel2: TPanel;
    dbeDataInicio: TCMDateTimePicker;
    Label3: TLabel;
    btnBuscaMestre: TBitBtn;
    dbeIdInventario: TwwDBEdit;
    Label1: TLabel;
    dbeResponsavel: TwwDBEdit;
    Label4: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    dbGrd: TwwDBGrid;
    qryTermo: TwwQuery;
    dsTermo: TwwDataSource;
    updTermo: TUpdateSQL;
    qryDet: TwwQuery;
    dsDet: TwwDataSource;
    updDet: TUpdateSQL;
    qryTermoIDSELBAIXA: TFloatField;
    qryTermoSBTIPOMOV: TFloatField;
    qryTermoSBXTERMO: TFloatField;
    qryTermoSBXPROCESSO: TStringField;
    qryTermoSBXDATA: TDateTimeField;
    qryTermoIDRESPONSAVEL: TFloatField;
    qryTermoSBXFLGEXECUTADO: TFloatField;
    qryTermoSBXDTAEXECUTADO: TDateTimeField;
    qryDetIDSELBAIXA: TFloatField;
    qryDetIDBEM: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONJUNTO: TFloatField;
    qryDetIDGRUPO: TFloatField;
    qryDetIDCONJATUAL: TFloatField;
    qryDetIDGRUPATUAL: TFloatField;
    qryVerificaGrupo: TwwQuery;
    qryVerificaGrupoIDGRUPO: TFloatField;
    qryBuscaGrupo: TwwQuery;
    qryBuscaGrupoIDGRUPO: TFloatField;
    qryInventBensIDINVENTARIOBENS: TFloatField;
    qryInventBensIDEMPRESA: TFloatField;
    qryInventBensIDRESPONSAVEL: TFloatField;
    qryInventBensDATAINILEVANT: TDateTimeField;
    qryInventBensDATAFIMLEVANT: TDateTimeField;
    qryInventBensSTATUS: TFloatField;
    qryInventBensIDSELBAIXA: TFloatField;
    qryInventBensNOMERESP: TStringField;
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
    qryDESBEM: TStringField;
    qryIDBEM: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDCONJUNTO: TFloatField;
    qryIDGRUPO: TFloatField;
    qryIDCLASSEBEM: TFloatField;
    qryIDLOCALIZACAO: TFloatField;
    qryDESCFLGPLACA: TStringField;
    qryDESCCONJATUAL: TStringField;
    qryNOMELOCAATUAL: TStringField;
    qryDESCCONJNOVO: TStringField;
    qryNOMELOCANOVO: TStringField;
    MSInventBens: TMontaSelect;
    qryBensEscravos: TwwQuery;
    qryBensEscravosIDPESSOA: TFloatField;
    qryBensEscravosIDBEM: TFloatField;
    qryBensEscravosPLACA: TFloatField;
    qryDetIDLOCALIZACAO: TFloatField;
    qryDetIDRESPONSAVEL: TFloatField;
    qryDetIDLOCALATUAL: TFloatField;
    qryDetIDRESPATUAL: TFloatField;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryIIBIDBEM: TFloatField;
    qryRemSelBaixa: TwwQuery;
    qryRemSelBaixaBens: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaMestreClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    iDigMascPlaca : Integer;
  end;

var
  frmInvProcessar: TfrmInvProcessar;

implementation

{$R *.DFM}

uses uVerificaPreenchimento, uSistema, uMensErro, uAtivoFixo,
     dBaseDados, uDatabase, fInvProcSelTermo, dAtivoFixo, fAguarde;

procedure TfrmInvProcessar.FormCreate(Sender: TObject);
begin
   inherited;
   if not qry.Prepared then qry.Prepare;
   qryLocal.Prepare;
   qryInventBens.Prepare;
   qryVerificaGrupo.Prepare;
   qryBuscaGrupo.Prepare;
   qryTermo.Prepare;
   qryDet.Prepare;
   qryBensEscravos.Prepare;
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo.qryParamCAF do
   begin
      Close;
      ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      Open;
      iDigMascPlaca := FieldByName('DIGMASCPLACA').AsInteger;
   end;
end;
//========================================================================================
procedure TfrmInvProcessar.FormShow(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnSair.SetFocus;
end;
//========================================================================================
procedure TfrmInvProcessar.btnBuscaMestreClick(Sender: TObject);
begin
   inherited;
   MSInventBens.Executar;
   Application.ProcessMessages;
   if (MSInventBens.RetornouValor) then
   begin
      Screen.Cursor := crHourGlass;
      //----------------------------------------------------------------------------------
      qryInventBens.Close;
      qryInventBens.Params[0].Value := MSInventBens.ValoresChave[0];
      qryInventBens.Params[1].Value := MSInventBens.ValoresChave[1];
      qryInventBens.Open;
      //----------------------------------------------------------------------------------
      if (qryInventBensSTATUS.AsInteger >= 1) then
      begin
         ckbEncerrado.Checked := True;
         edDataFim.Text := qryInventBensDATAFIMLEVANT.AsString;
      end else
      begin
         Msgdlg('O levantamento no.'+MSInventBens.ValoresChave[0]+' ainda não está encerrado!.'+#13+
                'Retorne ao Registra Resultado e encerre-o.', 'Erro', mtError, [mbOk], 0);
         exit;
      end;
      //----------------------------------------------------------------------------------
      qry.Close;
      qry.Params[0].Value := qryInventBensIDINVENTARIOBENS.AsInteger;
      qry.Params[1].Value := qryInventBensIDEMPRESA.AsInteger;
      qry.Open;
      //----------------------------------------------------------------------------------
      if qry.IsEmpty then
      begin
         bbtnConfirmar.Enabled := False;
      end else
      begin
         bbtnConfirmar.Enabled := True;
      end;
      //----------------------------------------------------------------------------------
      qryTermo.Close;
      qryTermo.ParamByName('PIDSELBAIXA').AsInteger := -1;
      qryTermo.Open;
      qryDet.Close;
      qryDet.ParamByName('PIDSELBAIXA').AsInteger := -1;
      qryDet.Open;
      //----------------------------------------------------------------------------------
      if (qryInventBensSTATUS.AsInteger < 2) then
      begin
         bbtnConfirmar.Enabled := True;
      end else
      begin
         bbtnConfirmar.Enabled := False;
         MsgDlg('Inventário já Processado! ' + #13 +
                'Termo de Transferência Número ' + qryInventBensIDSELBAIXA.AsString + ' Gerado.',
                'Erro', mtError, [mbOk], 0);
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      dbGrd.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmInvProcessar.bbtnConfirmarClick(Sender: TObject);
var
   iIdSelBaixa, iRespTermo, iGrupo, iTam : Integer;
   dDataTermo                            : tDateTime;
   bBensSemGrupo                         : Boolean;
   sProcesso, sPlacaBase                 : String;
   fTermo, fRespAtual, fRespNovo         : Double;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Códigos de Status
   //-------------------------------------------------------------------------------------
   // 0 - Inventário em Andamento
   // 1 - Inventário Encerrado
   // 2 - Inventário Processado
   //-------------------------------------------------------------------------------------
   // Códigos de iibFlgPlaca
   //-------------------------------------------------------------------------------------
   // 0 - Sem Resultado
   // 1 - Ok
   // 2 - Placa não encontrada
   // 3 - Placa EM outro Local
   // 4 - Placa DE outro Local
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   //-------------------------------------------------------------------------------------
   if (dbeIdInventario.Text = '') then
   begin
      MsgDlg('Selecione um Levantamento antes de executar o processamento! ',
             'Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      dbeIdInventario.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se todos os bens com Mudança de Local estão com os novos conjuntos
   // definidos
   //-------------------------------------------------------------------------------------
   qry.DisableControls;
   qry.First;
   while not qry.EOF do
   begin
      if (qryIIBCONJUNTONOVO.IsNull) then
      begin
         MsgDlg('O Bem ' + qryIIBPLACA.AsString + ' está sem o novo conjunto definido!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         qry.EnableControls;
         dbGrd.SetFocus;
         exit;
      end;
      qry.Next;
   end;
   //-------------------------------------------------------------------------------------
   // Le os Dados para a Geração do Termo de Transferência
   //-------------------------------------------------------------------------------------
   Application.CreateForm(TfrmInvProcSelTermo,frmInvProcSelTermo);
   frmInvProcSelTermo.FormStyle := FsNormal;
   frmInvProcSelTermo.Visible   := False;
   frmInvProcSelTermo.ShowModal;
   //-------------------------------------------------------------------------------------
   if ((frmInvProcSelTermo.edTermo.Value    = 0 )  or
       (frmInvProcSelTermo.edTermo.Text     = '')  or
       (frmInvProcSelTermo.edProcesso.Text  = '')  or
       (frmInvProcSelTermo.edDataTermo.Text = '')  or
       (frmInvProcSelTermo.edNomeResp.Text  = '')) then
   begin
      frmInvProcSelTermo.Release;
      MsgDlg('Informe os dados corretos do Termo de Transferência! ','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      dbeIdInventario.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTermo     := frmInvProcSelTermo.edTermo.Value;
      sProcesso  := frmInvProcSelTermo.edProcesso.Text;
      dDataTermo := frmInvProcSelTermo.edDataTermo.Date;
      iRespTermo := frmInvProcSelTermo.iIdResponsavel;
      frmInvProcSelTermo.Release;
   end;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   iIdSelBaixa := -1;
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      iIdSelBaixa := LeUltRegistro(nil,'SELBAIXA');
      qryTermo.Insert;
      qryTermoIDSELBAIXA.AsInteger      := iIdSelBaixa;
      qryTermoSBTIPOMOV.AsInteger       := 1;               // Seleção para Transferencia
      qryTermoSBXTERMO.AsFloat          := fTermo;
      qryTermoSBXPROCESSO.AsString      := sProcesso;
      qryTermoSBXDATA.AsDateTime        := dDataTermo;
      qryTermoIDRESPONSAVEL.AsInteger   := iRespTermo;
      qryTermoSBXFLGEXECUTADO.AsInteger := 0;
      qryTermo.Post;
      qryTermo.ApplyUpdates;
      //----------------------------------------------------------------------------------
      bBensSemGrupo := False;
      frmAguarde.Min := 0;
      frmAguarde.Max := qry.RecordCount;
      frmAguarde.Pos := 0;
      qry.First;
      while not qry.EOF do
      begin
         frmAguarde.Mostra('Termo de Transferência ' + floattostr(fTermo) + ' - Placa ' + qryIIBPLACA.AsString);
         //-------------------------------------------------------------------------------
         // Verificar se a mudança de localização/conjunto irá acarretar uma mudança
         // de grupo
         //-------------------------------------------------------------------------------
         qryVerificaGrupo.Close;
         qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qryIDGRUPO.AsInteger;
         qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qryIIBCONJUNTONOVO.AsInteger;
         qryVerificaGrupo.Open;
         if qryVerificaGrupo.IsEmpty then
         begin
            qryBuscaGrupo.Close;
            qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qryIIBLOCALNOVO.AsInteger;
            qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qryIDCLASSEBEM.AsInteger;
            qryBuscaGrupo.Open;
            if not qryBuscaGrupo.IsEmpty then
            begin
               iGrupo := qryBuscaGrupoIDGRUPO.AsInteger;
            end else
            begin
               iGrupo := 0;
               bBensSemGrupo := True;
            end;
         end else
         begin
            iGrupo := qryIDGRUPO.AsInteger;
         end;
         //-------------------------------------------------------------------------------
         qryDet.Insert;
         qryDetIDSELBAIXA.AsInteger   := iIdSelBaixa;
         qryDetIDBEM.AsInteger        := qryIDBEM.AsInteger;
         qryDetIDPESSOA.AsInteger     := qryIDPESSOA.AsInteger;
         qryDetIDCONJATUAL.AsInteger  := qryIDCONJUNTO.AsInteger;
         qryDetIDGRUPATUAL.AsInteger  := qryIDGRUPO.AsInteger;
         qryDetIDLOCALATUAL.AsInteger := qryIIBLOCALATUAL.AsInteger;
         //-------------------------------------------------------------------------------
         // Captura o responsavel atual
         //-------------------------------------------------------------------------------
         qryLocal.Close;
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryIIBLOCALATUAL.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := qryIDPESSOA.AsInteger;
         qryLocal.Open;
         fRespAtual := qryLocalIDRESPONSAVEL.AsFloat;
         qryDetIDRESPATUAL.AsFloat := fRespAtual;
         //-------------------------------------------------------------------------------
         qryDetIDCONJUNTO.AsInteger := qryIIBCONJUNTONOVO.AsInteger;
         if (iGrupo = 0) then
            qryDetIDGRUPO.Clear
         else
            qryDetIDGRUPO.AsInteger := iGrupo;
         qryDetIDLOCALIZACAO.AsInteger := qryIIBLOCALNOVO.AsInteger;
         //-------------------------------------------------------------------------------
         // Captura o responsavel novo
         //-------------------------------------------------------------------------------
         qryLocal.Close;
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryIIBLOCALNOVO.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := qryIDPESSOA.AsInteger;
         qryLocal.Open;
         fRespNovo := qryLocalIDRESPONSAVEL.AsFloat;
         qryDetIDRESPONSAVEL.AsFloat := fRespNovo;
         //-------------------------------------------------------------------------------
         qryDet.Post;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         // Gravação dos bens escravos do bem principal
         //-------------------------------------------------------------------------------
         iTam       := length(qryIIBPLACA.AsString) - iDigMascPlaca;
         sPlacaBase := copy(qryIIBPLACA.AsString, 1, iTam);
         qryBensEscravos.Close;
         qryBensEscravos.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
         qryBensEscravos.ParamByName('TAM').AsInteger         := iTam;
         qryBensEscravos.ParamByName('PLACABASE').AsString    := sPlacaBase;
         qryBensEscravos.ParamByName('PLACAMESTRE').AsInteger := qryIIBPLACA.AsInteger;
         qryBensEscravos.Open;
         while not qryBensEscravos.EOF do
         begin
            if length(qryBensEscravosPLACA.AsString) = length(qryIIBPLACA.AsString) then
            begin
               frmAguarde.Mostra('Termo de Transferência ' + floattostr(fTermo) + ' - Placa ' + qryBensEscravosPLACA.AsString);
               qryDet.Insert;
               qryDetIDSELBAIXA.AsInteger   := iIdSelBaixa;
               qryDetIDBEM.AsInteger        := qryBensEscravosIDBEM.AsInteger;
               qryDetIDPESSOA.AsInteger     := qryBensEscravosIDPESSOA.AsInteger;
               //-------------------------------------------------------------------------
               qryDetIDCONJATUAL.AsInteger  := qryIDCONJUNTO.AsInteger;
               qryDetIDGRUPATUAL.AsInteger  := qryIDGRUPO.AsInteger;
               qryDetIDLOCALATUAL.AsInteger := qryIIBLOCALATUAL.AsInteger;
               qryDetIDRESPATUAL.AsFloat    := fRespAtual;
               //-------------------------------------------------------------------------
               qryDetIDCONJUNTO.AsInteger   := qryIIBCONJUNTONOVO.AsInteger;
               if (iGrupo = 0) then
                  qryDetIDGRUPO.Clear
               else
                  qryDetIDGRUPO.AsInteger := iGrupo;
               //-------------------------------------------------------------------------
               qryDetIDLOCALIZACAO.AsInteger := qryIIBLOCALNOVO.AsInteger;
               qryDetIDRESPONSAVEL.AsFloat   := fRespNovo;
               //-------------------------------------------------------------------------
               qryDet.Post;
               qryDet.ApplyUpdates;
            end;
            qryBensEscravos.Next;
         end;
         //-------------------------------------------------------------------------------
         frmAguarde.Pos := frmAguarde.Pos + 1;
         if (frmAguarde.Pos mod 250) = 0 then
         begin
            CommitTransacao;
            StartTransacao;
         end;
         //-------------------------------------------------------------------------------
         qry.Next;
      end;
      //----------------------------------------------------------------------------------
      qryInventBens.Edit;
      qryInventBensSTATUS.AsInteger := 2;                   // Inventário Processado
      qryInventBensIDSELBAIXA.AsInteger := iIdSelBaixa;     // Termo de Transf. Gerado.
      qryInventBens.Post;
      qryInventBens.ApplyUpdates;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      frmAguarde.Apaga;
      //----------------------------------------------------------------------------------
      if bBensSemGrupo then
         MsgDlg('Termo de Transferência relativo ao levantamento foi gerado com bens sem ' +
                'Grupo Contábil definido. Processe eles em SELEÇÃO PARA TRANSFERÊNCIA',
                'Informação', mtInformation, [mbOk], 0)
      else
         MsgDlg('Termo de Transferência Gerado. Processe-o em TRANFERÊNCIA DE BENS.',
                'Informação', mtInformation, [mbOk], 0);
   except
      RollBackTransacao;
      frmAguarde.Apaga;
      MsgDlg('Erro na Geração do Termo de Transferência no Bem ' + qryIIBPLACA.AsString +
             ' . Termo de Transferência de Bens não Gerado',
             'Erro', mtError, [mbOk], 0);
      //----------------------------------------------------------------------------------
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Removendo o Termo de Transferência ' + floattostr(fTermo));
      qryRemSelBaixaBens.ParamByName('IDSELBAIXA').AsInteger := iIdSelbaixa;
      qryRemSelBaixaBens.ExecSQL;
      qryRemSelBaixa.ParamByName('IDSELBAIXA').AsInteger := iIdSelbaixa;
      qryRemSelBaixa.ExecSQL;
      frmAguarde.Apaga;
   end;
   //-------------------------------------------------------------------------------------
   qry.EnableControls;
   qryInventBens.Close;
   ckbEncerrado.Checked := False;
   edDataFim.Text := '';
   qry.Close;
   bbtnConfirmar.Enabled := False;
   dbeIdInventario.SetFocus;
end;
//========================================================================================
procedure TfrmInvProcessar.dbGrdCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;
//========================================================================================
procedure TfrmInvProcessar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryInventBens.Close;
   qryVerificaGrupo.Close;
   qryBuscaGrupo.Close;
   qryTermo.Close;
   qryDet.Close;
   qryBensEscravos.Close;
   qryLocal.Close;
   //
   qryLocal.UnPrepare;
   qry.UnPrepare;
   qryInventBens.UnPrepare;
   qryVerificaGrupo.UnPrepare;
   qryBuscaGrupo.UnPrepare;
   qryTermo.UnPrepare;
   qryDet.UnPrepare;
   qryBensEscravos.UnPrepare;
end;

end.

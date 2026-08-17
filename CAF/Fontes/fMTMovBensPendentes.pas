unit fMTMovBensPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, 
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Gauges, DB, DBClient, uCMClientDataSet, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlDomBem, uCtrlParamCAF, uCtrlMovBensPendentes, uCtrlPadroes, uCtrlGrupoContab,
  IvEMulti;

type
  TfrmMTMovBensPendentes = class(TfrmOkCancelar)
    cdsNotas: TCMClientDataSet;
    dsNotas: TwwDataSource;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    pnlSelNota: TPanel;
    Label2: TLabel;
    dbgNotas: TwwDBGrid;
    bbtnProcessaNotas: TBitBtn;
    pnlSelBem: TPanel;
    Label1: TLabel;
    bbtnProcessaBem: TBitBtn;
    cdsDet: TCMClientDataSet;
    dsDet: TwwDataSource;
    cdsRateio: TCMClientDataSet;
    dsRateio: TwwDataSource;
    cdsPlaca: TCMClientDataSet;
    cdsGrupoTaxaDep: TCMClientDataSet;
    dbgBensPend: TwwDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnProcessaNotasClick(Sender: TObject);
    procedure bbtnProcessaBemClick(Sender: TObject);
    procedure dbgBensPendDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

  private
    { Private declarations }
    ParamCAF      : TCtrlParamCAF;
    Bem           : TCtrlDomBem;
    BensPendentes : TCtrlMovBensPendentes;
    GrupoContab   : TCtrlGrupoContab;
    procedure CarregaNotasPendentes;
    procedure AtivaBensPendentes(bAtiva : boolean);

  public
    { Public declarations }

  end;

var
  frmMTMovBensPendentes: TfrmMTMovBensPendentes;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, fMTCadBemPendente, fTelaAut;

procedure TfrmMTMovBensPendentes.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   BensPendentes := TCtrlMovBensPendentes.Create;
   BensPendentes.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   AtivaBensPendentes(False);
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.CarregaNotasPendentes;
begin
   cdsNotas.Data := BensPendentes.ListarNotas(Sistema.IdEmpresa);
   TFloatField(cdsNotas.FieldByName('SOMANOTA')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   cds.Data := BensPendentes.ListarBensNota(0,0,'');
   TFloatField(cds.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.bbtnProcessaNotasClick(Sender: TObject);
begin
   inherited;
   AtivaBensPendentes(True);
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.AtivaBensPendentes(bAtiva : boolean);
begin
   try
      if bAtiva then
      begin

         cds.Data := BensPendentes.ListarBensNota(cdsNotas.FieldByName('IDPESSOA').AsFloat,
                                                  cdsNotas.FieldByName('IDFORNSERV').AsFloat,
                                                  trim(cdsNotas.FieldByName('IDNOTA').AsString));
         TFloatField(cds.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
         //-------------------------------------------------------------------------------
         // Verifica se algum Bem Pendente já foi cadastrado no CAF
         //-------------------------------------------------------------------------------
         cds.First;
         while not cds.EOF do
         begin
            if cds.FieldByName('PLACA').AsFloat > 0 then
            begin
               cdsPlaca.Data := BensPendentes.DadosPlaca(cds.FieldByName('IDPESSOA').AsFloat,
                                                         cds.FieldByName('PLACA').AsFloat);
               //-------------------------------------------------------------------------
               if not cdsPlaca.IsEmpty then
               begin
                  if MsgDlg('Já existe um Bem Cadastrado no Ativo Fixo com a Placa ' + cdsPlaca.FieldByName('PLACA').AsString + ' : ' + #13 + #13 +
                            'Descrição'+#9+': ' + cdsPlaca.FieldByName('DESBEM').AsString + #13 +
                            'Documento'+#9+': ' + cdsPlaca.FieldByName('IDNOTA').AsString + #13 +
                            'Data'+#9+#9+': ' + cdsPlaca.FieldByName('DTANOTA').AsString + #13 +
                            'Fornecedor'+#9+': ' + cdsPlaca.FieldByName('NOMEFORN').AsString + #13 + #13 +
                            'Deseja marcar o Bem Pendente como já registrado no Ativo Fixo ?',
                            'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                     if not Sistema.GravaLogOperacoes('Remoção de Bens Pendentes do Bem ' + cds.FieldByName('PLACA').AsString) then
                        raise Exception.Create('Erro ao gravar Log de Operação');
                     if not BensPendentes.RemoveBensPendentes(cds.FieldByName('IDBENSPENDENTES').AsFloat,
                                                              cds.FieldByName('IDPESSOA').AsFloat) then
                        raise Exception.Create(BensPendentes.MessageInfo);
                  end;
               end;
            end;
            cds.Next;
         end;
         //-------------------------------------------------------------------------------
         cds.Data := BensPendentes.ListarBensNota(cdsNotas.FieldByName('IDPESSOA').AsFloat,
                                                  cdsNotas.FieldByName('IDFORNSERV').AsFloat,
                                                  trim(cdsNotas.FieldByName('IDNOTA').AsString));
         TFloatField(cds.FieldByName('VALORG')).DisplayFormat := '#,##0.00;(#,##0.00); ';
         //-------------------------------------------------------------------------------
         if cds.IsEmpty then
         begin
            CarregaNotasPendentes;
            //----------------------------------------------------------------------------
            pnlSelNota.Enabled := True;
            pnlSelBem.Enabled  := False;
            bbtnProcessaNotas.Enabled := True;
            bbtnProcessaBem.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled := False;
         end else
         begin
            cdsDet.Data := BensPendentes.ListarBensNotaxDep(0,0,'');
            cds.First;
            while not cds.EOF do
            begin
               //-------------------------------------------------------------------------
               // Carga das Multiplas Taxas com Grupo Selecionado
               //-------------------------------------------------------------------------
               if not cds.FieldByName('IDGRUPO').IsNull then
               begin
                  cdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(cds.FieldByName('IDGRUPO').AsFloat,
                                                                        cds.FieldByName('IDPESSOA').AsFloat);
                  if cdsGrupoTaxaDep.IsEmpty then
                     Raise Exception.Create('Grupo Contábil do Bem ' + floattostr(cds.FieldByName('PLACA').AsFloat) +
                                            ' não possui taxa(s) de depreciação definida(s)!' + #13 +
                                            'Consulte o Cadastro de Grupos Contábeis.');
                  //----------------------------------------------------------------------
                  while not cdsGrupoTaxaDep.EOF do
                  begin
                     cdsDet.Append;
                     cdsDet.FieldByName('IDPESSOA').AsFloat        := cds.FieldbyName('IDPESSOA').AsFloat;
                     cdsDet.FieldByName('IDBENSPENDENTES').AsFloat := cds.FieldbyName('IDBENSPENDENTES').AsFloat;
                     cdsDet.FieldByName('MOECODIGO').AsInteger     := ParamCAF.MOEDAOFICIAL;
                     cdsDet.FieldByName('IDBEMXDEP').AsInteger     := cdsGrupoTaxaDep.FieldByName('IDTAXADEP').AsInteger;
                     cdsDet.FieldByName('TAXADEP').AsFloat         := cdsGrupoTaxaDep.FieldByName('TAXADEP').AsFloat;
                     cdsDet.FieldByName('DESCTAXADEP').AsString    := cdsGrupoTaxaDep.FieldByName('DESCTAXADEP').AsString;
                     cdsDet.Post;
                     //-------------------------------------------------------------------
                     cdsGrupoTaxaDep.Next;
                  end;
               end;
               //-------------------------------------------------------------------------
               cds.Next;
            end;
            cdsRateio.Data := BensPendentes.ListarBensNotaxRateio(0,0,'');
            //----------------------------------------------------------------------------
            pnlSelNota.Enabled := False;
            pnlSelBem.Enabled  := True;
            bbtnProcessaNotas.Enabled := False;
            bbtnProcessaBem.Enabled   := True;
            bbtnConfirmar.Enabled     := True;
            bbtnCancelar.Enabled      := True;
         end;
      end else
      begin
         CarregaNotasPendentes;
         //-------------------------------------------------------------------------------
         pnlSelNota.Enabled := True;
         pnlSelBem.Enabled  := False;
         bbtnProcessaNotas.Enabled := True;
         bbtnProcessaBem.Enabled   := False;
         bbtnConfirmar.Enabled     := False;
         bbtnCancelar.Enabled      := False;
      end;
   except
      On E : Exception do
      begin
         MsgDlg(E.Message, 'Erro', mtError, [mbOk], 0);
         //-------------------------------------------------------------------------------
         cdsNotas.Data := BensPendentes.ListarNotas(Sistema.IdEmpresa);
         cds.Close;
         cdsDet.Close;
         cdsRateio.Close;
         //-------------------------------------------------------------------------------
         pnlSelNota.Enabled := True;
         pnlSelBem.Enabled  := False;
         bbtnProcessaNotas.Enabled := True;
         bbtnProcessaBem.Enabled   := False;
         bbtnConfirmar.Enabled     := False;
         bbtnCancelar.Enabled      := False;
      end;
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.bbtnProcessaBemClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TFrmMTCadBemPendente,frmMTCadBemPendente);
   frmMTCadBemPendente.FormStyle := FsNormal;
   frmMTCadBemPendente.Visible   := False;
   frmMTCadBemPendente.Top       := 94;
   frmMTCadBemPendente.ShowModal;
   //-------------------------------------------------------------------------------------
   frmMTCadBemPendente.Release;
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.dbgBensPendDblClick(Sender: TObject);
begin
   inherited;
   cds.Edit;
   if cds.FieldbyName('ALTERADO').AsInteger = 1 then
      cds.FieldbyName('ALTERADO').AsInteger := 0;
   cds.Post;
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.bbtnConfirmarClick(Sender: TObject);
var
   rBemPendente : TModalResult;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   try
      cds.First;
      while not cds.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Verifica a possível duplicidade de placas
         //-------------------------------------------------------------------------------
         if cds.FieldByName('PLACA').AsFloat > 0 then
         begin
            cdsPlaca.Data := BensPendentes.DadosPlaca(cds.FieldByName('IDPESSOA').AsFloat,
                                                      cds.FieldByName('PLACA').AsFloat);
            //----------------------------------------------------------------------------
            if not cdsPlaca.IsEmpty then
            begin
               rBemPendente := MsgDlg('Já existe um Bem Cadastrado no Ativo Fixo com a Placa ' + cdsPlaca.FieldByName('PLACA').AsString + ' : ' + #13 + #13 +
                                      'Descrição'+#9+': ' + cdsPlaca.FieldByName('DESBEM').AsString + #13 +
                                      'Documento'+#9+': ' + cdsPlaca.FieldByName('IDNOTA').AsString + #13 +
                                      'Data'+#9+#9+': ' + cdsPlaca.FieldByName('DTANOTA').AsString + #13 +
                                      'Fornecedor'+#9+': ' + cdsPlaca.FieldByName('NOMEFORN').AsString + #13 + #13 +
                                      'Deseja marcar o Bem Pendente como já registrado no Ativo Fixo ?',
                                      'Confirmação',mtConfirmation,[mbYes,mbNo,MbCancel],0);
               case rBemPendente of
                  mrYes    : begin
                                if not Sistema.GravaLogOperacoes('Remoção de Bens Pendentes do Bem ' + cds.FieldByName('PLACA').AsString) then
                                   raise Exception.Create('Erro ao gravar Log de Operação');
                                if not BensPendentes.RemoveBensPendentes(cds.FieldByName('IDBENSPENDENTES').AsFloat,
                                                                         cds.FieldByName('IDPESSOA').AsFloat) then
                                   raise Exception.Create(BensPendentes.MessageInfo);
                             end;
                  mrCancel : Raise Exception.Create('Processamento da Nota Cancelado pelo Usuário!');
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         cds.Next;
      end;
      //----------------------------------------------------------------------------------
      // Inicializa os cds do objeto de controle
      //----------------------------------------------------------------------------------
      BensPendentes.cdsBP.Data := cds.Data;
      BensPendentes.cdsBPTaxasDep.Data := cdsDet.Data;
      BensPendentes.cdsBPPlanoPatroxBem.Data := cdsRateio.Data;
      //----------------------------------------------------------------------------------
      // Registra os bens do documento
      //----------------------------------------------------------------------------------
      if not BensPendentes.RegistraBensNota(Sistema.IdUsuario) then
         Raise Exception.Create(BensPendentes.MessageInfo);
      //----------------------------------------------------------------------------------
      AtivaBensPendentes(False);
      //----------------------------------------------------------------------------------
      MsgDlg('BENS do Documento selecionado cadastrados no Ativo Fixo.',
             'Informação', mtInformation, [mbOk], 0);
   except
      On E : Exception do
      begin
         MsgDlg('BENS do Documento selecionado NÃO cadastrados no Ativo Fixo.'+#13+#13+
                'Causa : '+E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   Bem.Free;
   BensPendentes.Free;
   GrupoContab.Free;
end;
//========================================================================================
procedure TfrmMTMovBensPendentes.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   AtivaBensPendentes(False);
end;

end.

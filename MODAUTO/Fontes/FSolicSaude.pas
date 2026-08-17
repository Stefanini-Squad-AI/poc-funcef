unit FSolicSaude;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Spin, DBCtrls, Mask, wwdbedit, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TfrmSolicSaude = class(TfrmOkCancelar)
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    sbtnProcurar: TSpeedButton;
    dbtxtSituacao: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    rgTipoAcao: TRadioGroup;
    gbxDepen: TGroupBox;
    spedDepen: TSpinEdit;
    gbxObserv: TGroupBox;
    MontaSelect: TMontaSelect;
    edObserv: TMemo;
    qry: TwwQuery;
    ds: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSolicSaude: TfrmSolicSaude;
  iIdTipoProcesso: Longint;

implementation

uses UsoGeralRH, uMensErro, uRAD, uFuncoesUteisRH, uSistema, uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmSolicSaude.FormCreate(Sender: TObject);
begin
  inherited;
  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
  Begin
     Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,
          'SELECT TP.IDTIPOPROCESSO'+#13+
          'FROM RADTIPOPROCESSO TP, RADRESPONXGRP GR'+#13+
          'WHERE (TP.IDGRPCRIAPROCESSO = GR.IDGRPRESPON) AND'+#13+
          '      (GR.IDUSUARIO = ' +IntToStr(Sistema.IdUsuario)+ ') AND'+#13+
          '      (TP.IDREFERENCIA = 22)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  end;

  if iIdTipoProcesso <=0  then
  begin
      MsgDlg('Tipo de Processo não foi criado no RAD. Providencie ou solicite providências !',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      Close;
      exit;
  end;

  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  // Usuário Individual
  if sUsoGeralIdPessoa <> '' then
  begin
    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = ' + sUsoGeralIdPessoa);
    sbtnProcurar.Visible := False;
  end;

  with (MontaSelect.Filtro) do
  begin
    Add('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;

  sbtnProcurarClick(Self);
end;

procedure TfrmSolicSaude.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if (sUsoGeralIdPessoa = '') then
    MontaSelect.Executar;
  sbtnProcurar.Down := false;

  if  (sUsoGeralIdPessoa <> '') or
      ((MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')) then
  begin
    qry.Close;
    if (sUsoGeralIdPessoa <> '') then
      qry.ParamByName('IDPESSOA').asInteger := StrToInt(sUsoGeralIdPessoa)
    else
      qry.ParamByName('IDPESSOA').asInteger := StrToInt(MontaSelect.ValoresChave[6]);
    qry.Open;

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end
  else
  begin
    qry.Close;
    qry.ParamByName('IDPESSOA').asInteger := -1;
    qry.Open;
  end;

end;

procedure TfrmSolicSaude.bbtnConfirmarClick(Sender: TObject);
var
  iProcesso : Longint;
begin
  inherited;
  if  MsgDlg('Confirma a Solicitação de ' + rgTipoAcao.Items[rgTipoAcao.ItemIndex] +
             ' no Plano de Saúde ?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes then exit;

   If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
   Begin
         Rad.TipoProcesso    := iIdTipoProcesso;
         Rad.IdPessoa        := Sistema.IdEmpresa;
         Rad.IdPessResp      := trunc(qry.FieldByName('IDPESSOA').asFloat);
         //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
         //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
         Rad.OBS             := rgTipoAcao.Items[rgTipoAcao.ItemIndex] +
                                ' de ' + trim(dbedNome.Text) + ' no Plano de Saúde' +
                                 iff((rgTipoAcao.ItemIndex < 2), iff((spedDepen.Value > 0),
                                 ' com ' + IntToStr(spedDepen.Value), ' sem') +
                                 ' dependente' + iff((spedDepen.Value <> 1),'s','') + '.', '.') +
                                iff(edObserv.Text <> '', ' Observações: ' + edObserv.Text,'');

         //Rad.CodGrupoProd    := sGrupoProd;
         //
         with (DtmBaseDados.qry) do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
                     qry.FieldByName('IDPESSOA').asString);
            Open;
            if not IsEmpty then
            begin
               Rad.IdEmpresa       := FieldByName('IDEMPRESA').AsInteger;
               Rad.CodCentroCusto  := FieldByName('CODCENTROCUSTO').AsString;
            end;
            Close;
         end;
         iProcesso :=  Rad.IniciarProcesso;
         if iProcesso < 0 Then
         Begin
            MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
            Abort;
         End
         Else
            MsgDlg('Processo RAD Nº '+ IntToStr(iProcesso)+' foi criado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);

   End;

   MsgDlg('Encaminhar documento comprobatório para efetivação do solicitado.',
          'Aviso',mtWarning,[mbOk],0);
end;

procedure TfrmSolicSaude.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

end.

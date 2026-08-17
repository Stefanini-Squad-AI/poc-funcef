unit FSolicServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Spin, DBCtrls, Mask, wwdbedit, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TfrmSolicServico = class(TfrmOkCancelar)
    sbtnProcurar: TSpeedButton;
    Label2: TLabel;
    Bevel1: TBevel;
    gbxObserv: TGroupBox;
    MontaSelect: TMontaSelect;
    edObserv: TMemo;
    qry: TwwQuery;
    ds: TwwDataSource;
    edDescricao: TMemo;
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
  frmSolicServico: TfrmSolicServico;
  iIdTipoProcesso: Longint;

implementation

uses UsoGeralRH, uMensErro, uRAD, uFuncoesUteisRH, uSistema, uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmSolicServico.FormCreate(Sender: TObject);
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
          '      (TP.IDREFERENCIA = 24)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  end;

  if iIdTipoProcesso <=0  then
  begin
      MsgDlg('Tipo de Processo não foi criado no RAD. Providencie ou solicite providências !',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      Close;
      exit;
  end;

end;

procedure TfrmSolicServico.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  sbtnProcurar.Down := false;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    edDescricao.Text := MontaSelect.ValoresChave[1];

end;

procedure TfrmSolicServico.bbtnConfirmarClick(Sender: TObject);
var
  iProcesso : Longint;
begin
  inherited;
  if (edDescricao.Text = '') then
  begin
    MsgDlg('Informe o Tipo de Serviço ou Produto a ser Solicitado.',
      'Aviso', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  if  MsgDlg('Confirma a Solicitação de ' + trim(edDescricao.Text) +
             ' ?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes then exit;

   If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) then
   Begin
         Rad.TipoProcesso    := iIdTipoProcesso;
         Rad.IdPessoa        := Sistema.IdEmpresa;
         //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
         //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
         Rad.OBS             := 'Solicitação de ' + trim(edDescricao.Text) +
                                iff(edObserv.Text <> '', '. Observações: ' + edObserv.Text,'');

         //Rad.CodGrupoProd    := sGrupoProd;
         //
         with (DtmBaseDados.qry) do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
                     IntToStr(Sistema.Idusuario));
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
         Begin
            MsgDlg('Processo RAD Nº '+ IntToStr(iProcesso)+' foi criado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
            bbtnSair.Click;
         End;


   End;

end;

procedure TfrmSolicServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Rad.Free;
end;

end.

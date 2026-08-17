{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Cunha
Data        : 25/10/2018
Descrição   : Alteração do Owner da tabela CONTRATOAD
-------------------------------------------------------------------------------
Pendência   : SOL 138239 KTN 843847
Responsável : Ádler Souza
Data        : 08/09/2010
Descrição   : Criação de funcionalidade para inserção de dados na tabela
              CARGA.CONTRATOAD
-------------------------------------------------------------------------------}

unit FManutContratoAd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase;

type
  TFrmManutContratoAd = class(TfrmOkCancelar)
    edtArquivo: TEdit;
    btnAbreArquivo: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    Label2: TLabel;
    btnLimpar: TfcShapeBtn;
    DBgrdHistMov: TwwDBGrid;
    qry: TwwQuery;
    ds: TwwDataSource;
    OpenDialog: TOpenDialog;
    memArquivo: TMemo;
    btnCarregar: TfcShapeBtn;
    qryDel: TwwQuery;
    qryInsert: TwwQuery;
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FazerRefresh;
    procedure HabilitarBotoes(iBtn : Integer);
    procedure DesabilitarBotoes(iBtn : Integer);
    procedure VerificaDuplicidade(Linha : String);
    procedure VerificaLimparContratoAD;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutContratoAd: TFrmManutContratoAd;

implementation

{$R *.DFM}

procedure TFrmManutContratoAd.btnLimparClick(Sender: TObject);
var
  Contador : Integer;
begin
  inherited;

  Contador := 0;

//  If (MessageDlg('Deseja excluir as informações existentes na Contratoad?',         //Everson Luiz - TIBERO
  If (MsgDlg('Deseja excluir as informações existentes na Contratoad?', 'Empréstimo', //Everson Luiz - TIBERO
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  Begin
    DesabilitarBotoes(3);

    qry.open;

    Contador := qry.RecordCount;

    StartTransacao;

    if dtmBaseDados.dbBaseDados.InTransaction then
    begin
      try
        qryDel.ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;

      Except
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Não foi possível Limpar a tabela CONTRATOAD.','Empréstimo',mtError,[mbOk],0);
      end;
    end;

    VerificaLimparContratoAD;

//    MessageDlg('Foram excluídos '+ intToStr(Contador) +' contratos.', mtInformation, [mbOK], 0);          //Everson Luiz - TIBERO
    MsgDlg('Foram excluídos '+ intToStr(Contador) +' contratos.', 'Empréstimo', mtInformation, [mbOK], 0);  //Everson Luiz - TIBERO

    HabilitarBotoes(3);
  end;
end;

procedure TFrmManutContratoAd.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  edtArquivo.Clear;
  memArquivo.Clear;
  DesabilitarBotoes(0);
  DesabilitarBotoes(1);
end;

procedure TFrmManutContratoAd.btnAbreArquivoClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
    edtArquivo.Text := OpenDialog.FileName;

  HabilitarBotoes(0);
end;

procedure TFrmManutContratoAd.bbtnConfirmarClick(Sender: TObject);
var
  Arquivo : TextFile;
  sLinha  : String;
  Contador : Integer;
begin
  inherited;

  Contador := 0;

  if edtArquivo.Text = '' then
  begin
//    MessageDlg('É necessário selecionar o arquivo para carregar as informações.', mtWarning, [mbOK], 0);         //Everson Luiz - TIBERO
    MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0); //Everson Luiz - TIBERO
    Exit;
  end;

  AssignFile(Arquivo,OpenDialog.FileName);
  Reset(Arquivo);
  try
    StartTransacao;

    DesabilitarBotoes(3);

    while not EOF(Arquivo) and dtmBaseDados.dbBaseDados.InTransaction do
    begin
      ReadLn(Arquivo,sLinha);

      if sLinha <> '' then
      begin
        // SE O CONTRATO JÁ EXISTIR NA TABELA, NÃO INSERIR.
        if not qry.Locate('IDCONTRATOEMPTMO', sLinha, []) then
        begin
          qryInsert.ParamByname('PIDCONTRATOEMPTMO').AsString := sLinha;
          qryInsert.ExecSql;
          inc(Contador);
        end;  
      end;
    end;

    dtmBaseDados.dbBaseDados.Commit;

    VerificaLimparContratoAD;

//    MessageDlg('Foram importados '+ intToStr(Contador) +' contratos.', mtInformation, [mbOK], 0);         //Everson Luiz - TIBERO
    MsgDlg('Foram importados '+ intToStr(Contador) +' contratos.', 'Empréstimo', mtInformation, [mbOK], 0); //Everson Luiz - TIBERO
    btnLimpaArquivo.Click;

    HabilitarBotoes(3);
  Except
    dtmBaseDados.dbBaseDados.Rollback;
    HabilitarBotoes(3);
    CloseFile(Arquivo);
  end;
  CloseFile(Arquivo);
end;

procedure TFrmManutContratoAd.btnCarregarClick(Sender: TObject);
var
  Arquivo : TextFile;
  sLinha  : String;
  iTesta  : Real;
begin
  inherited;

  if edtArquivo.Text = '' then
  begin
//    MessageDlg('É necessário selecionar o arquivo para carregar as informações.', mtWarning, [mbOK], 0);         //Everson Luiz - TIBERO
    MsgDlg('É necessário selecionar o arquivo para carregar as informações.', 'Empréstimo', mtWarning, [mbOK], 0); //Everson Luiz - TIBERO
    Exit;
  end;

  DesabilitarBotoes(3);

  AssignFile(Arquivo,OpenDialog.FileName);
  Reset(Arquivo);

  while not EOF(Arquivo) do
  begin
    ReadLn(Arquivo,sLinha);
    if sLinha <> '' then
    begin
      // VERIFICAR SE É NUMERICO
      try
        iTesta := strToFloat(sLinha);
      Except
//        MessageDlg('É necessário importar contratos válidos!', mtError, [mbOK], 0);          //Everson Luiz - TIBERO
        MsgDlg('É necessário importar contratos válidos!', 'Empréstimo', mtError, [mbOK], 0);  //Everson Luiz - TIBERO
        CloseFile(Arquivo);
        memArquivo.Clear;
        HabilitarBotoes(3);
        Exit;
      end;
      // SE O CONTRATO JÁ EXISTIR NA TABELA NÃO CARREGAR NO MEMO.
      if not qry.Locate('IDCONTRATOEMPTMO', sLinha, []) then
      begin
        memArquivo.lines.Add(sLinha);
      end;
    end;
  end;
  DesabilitarBotoes(0);
  HabilitarBotoes(1);
  HabilitarBotoes(3);

  CloseFile(Arquivo);
end;

procedure TFrmManutContratoAd.FormCreate(Sender: TObject);
begin
  inherited;

  DesabilitarBotoes(0);
  DesabilitarBotoes(1);

  VerificaLimparContratoAD;
end;

procedure TFrmManutContratoAd.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

// CODIGO DOS BOTOES
// 0 - Botão 'Carregar Arquivo'
// 1 - Botão 'Confirmar'
// 2 - Botão 'Limpar ContratoAD'
// 3 - Botão 'Sair'
procedure TFrmManutContratoAd.HabilitarBotoes(iBtn : Integer);
begin
  if iBtn = 0 then
    btnCarregar.Enabled := True
  else
    if iBtn = 1 then
      bbtnConfirmar.Enabled := True
    else
      if iBtn = 2 then
        btnLimpar.Enabled := True
      else
        if iBtn = 3 then
          bbtnSair.Enabled := True;
end;

procedure TFrmManutContratoAd.DesabilitarBotoes(iBtn : Integer);
begin
  if iBtn = 0 then
    btnCarregar.Enabled := False
  else
    if iBtn = 1 then
      bbtnConfirmar.Enabled := False
    else
      if iBtn = 2 then
        btnLimpar.Enabled := False
      else
        if iBtn = 3 then
          bbtnSair.Enabled := False;
end;

procedure TFrmManutContratoAd.VerificaDuplicidade(Linha : String);
begin
  with qry do
  begin
    if Locate('IDCONTRATOEMPTMO', Linha, []) then
    begin
      //Everson Luiz - TIBERO - Início
      //MessageDlg('O contrato '+Linha+' já existe. '+#13+
      //           'Não é possível carregar o arquivo.', mtError, [mbOK], 0);

      MsgDlg('O contrato '+Linha+' já existe. '+#13+
                 'Não é possível carregar o arquivo.', 'Empréstimo', mtError, [mbOK], 0);
      //Everson Luiz - TIBERO - Início

      Abort;
      btnLimpaArquivo.Click;
      memArquivo.Clear;
      HabilitarBotoes(3);
    end;
  end;
end;

procedure TFrmManutContratoAd.VerificaLimparContratoAD;
begin
  FazerRefresh;

  if qry.IsEmpty then
    DesabilitarBotoes(2)
  else
    HabilitarBotoes(2);
end;

end.

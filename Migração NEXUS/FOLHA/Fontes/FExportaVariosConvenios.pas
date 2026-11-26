unit FExportaVariosConvenios;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ComCtrls, FileCtrl, uExportacao, uSistema;

type
  TFrmExportaVariosConvenios = class(TfrmOkCancelar)
    dbgrdLayoutEntrxSaida: TwwDBGrid;
    lblMostraMensagem: TLabel;
    qryLayoutEntrxSaida: TwwQuery;
    dsLayoutEntrxSaida: TwwDataSource;
    lblMensArquivo: TLabel;
    LabelNomeArqTxt: TLabel;
    Bevel1: TBevel;
    gbAbono: TGroupBox;
    chkAbonoAnual: TCheckBox;
    grbMesAno: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbMes: TComboBox;
    edtAno: TEdit;
    UpDown1: TUpDown;
    lbGerando: TLabel;
    ProgressBar1: TProgressBar;
    updLayoutEntrxSaida: TUpdateSQL;
    btnEscolheDir: TBitBtn;
    pnlDiretorio: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    btnOkDir: TBitBtn;
    btnSairDiretorio: TBitBtn;
    chkMarcaTudo: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure DirectoryListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure btnOkDirClick(Sender: TObject);
    procedure btnSairDiretorioClick(Sender: TObject);
    procedure chkMarcaTudoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sAbonoAnual,
    sGuardaDir  : String;
    bErro       : Boolean;
    iFlgAbono   : Integer;
  public
    { Public declarations }
  end;

var
  FrmExportaVariosConvenios: TFrmExportaVariosConvenios;

implementation

uses
  UMensErro, UDatabase, UIntegraBack, uAdmPrevFB, Dbasedados, UobjFolha;

{$R *.DFM}

procedure TFrmExportaVariosConvenios.FormShow(Sender: TObject);
Var
  Dia, Mes, Ano : Word;

begin
  inherited;
  DecodeDate(Date, Ano, Mes, Dia);
  edtAno.Text      := IntToStr(Ano);
  cmbMes.ItemIndex := Mes - 1;
  sAbonoAnual      := Trim(edtAno.text)+'/13';
  qryLayoutEntrxSaida.Open;
  If Not qryLayoutEntrxSaida.IsEmpty Then
    chkMarcaTudo.Enabled := True;
end;

procedure TFrmExportaVariosConvenios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryLayoutEntrxSaida.Close;
end;

procedure TFrmExportaVariosConvenios.bbtnConfirmarClick(Sender: TObject);
Var
  bEscolheu : Boolean;
  sMes      : String;

begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  If Not Sistema.GravaLogOperacoes('Exportação de arquivo para vários convênios.') Then
    Raise Exception.Create('Não foi possível gravar o log.')
  Else
    dtmBaseDados.dbBaseDados.Commit;

  bEscolheu := False;
  If chkAbonoAnual.Checked Then
    iFlgAbono := 1
  Else
    iFlgAbono := 0;
  If edtAno.Text = '' Then
  Begin
    MsgDlg('Por favor, escolha o ano ...', 'Informação', mtInformation, [mbOk], 0);
    edtAno.SetFocus;
  End
  Else
    If cmbMes.Text = '' Then
    Begin
      MsgDlg('Por favor, escolha o mês ...', 'Informação', mtInformation, [mbOk], 0);
      cmbMes.SetFocus;
    End
    Else
      qryLayoutEntrxSaida.First;
      While Not qryLayoutEntrxSaida.Eof Do
      Begin
        If (qryLayoutEntrxSaida.FieldByName('FLGENVIAR').AsInteger = 1) And
           (Not bEscolheu) Then
          bEscolheu := True;
        qryLayoutEntrxSaida.Next;
      End;
      If Not bEscolheu Then
        MsgDlg('Por favor, escolha o Layout de Entrada e Saída.', 'Informação',
               mtInformation, [mbOk], 0)
      Else
      Begin

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //If Trim(LabelNomeArqTxt.Caption) = 'C:\' Then
        If Trim(LabelNomeArqTxt.Caption) = Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) Then

          MsgDlg('Destino do Arquivo de Retorno não preenchido ...', 'Informação',
                 mtInformation, [mbOk], 0)
        Else
        Begin
          sMes := edtAno.Text;
          If cmbMes.ItemIndex > 8 Then
            sMes := sMes + '/' + IntToStr(cmbMes.ItemIndex + 1)
          Else
            sMes := sMes + '/0' + IntToStr(cmbMes.ItemIndex + 1);
          ProgressBar1.Position := 0;
          ProgressBar1.Visible  := True;
          bbtnConfirmar.Enabled := False;
          lbGerando.Visible     := True;
          lbGerando.Update;
          sAbonoAnual           := Trim(edtAno.Text)+'/13';
          bErro                 := False;
          qryLayoutEntrxSaida.First;
          While Not qryLayoutEntrxSaida.Eof Do
          Begin
            If qryLayoutEntrxSaida.FieldByName('FLGENVIAR').AsInteger = 1 Then
            Begin
              LabelNomeArqTxt.Caption := sGuardaDir + '\' +
                                         qryLayoutEntrxSaida.FieldByName('NOMEARQ').AsString;

              Processar(qryLayoutEntrxSaida, iFlgAbono,
                        qryLayoutEntrxSaida.FieldByName('IDLAYOUT').AsInteger,
                        qryLayoutEntrxSaida.FieldByName('IDLAYOUTSAIDA').AsInteger,
                        qryLayoutEntrxSaida.FieldByName('FLGTIPOCONVENIO').AsInteger,
                        sMes, sAbonoAnual, LabelNomeArqTxt.Caption, bErro,
                        ProgressBar1,
                        false, 
                        '', '');
            End;
            qryLayoutEntrxSaida.Next;
          End;
          lbGerando.Visible     := False;
          If Not bErro Then
            MsgDlg('Geração de Arquivo de Saida de Dados Terminada.', 'Informação', mtWarning, [mbOk,mbHelp], 0);
        End;
      End;
end;

procedure TFrmExportaVariosConvenios.btnEscolheDirClick(Sender: TObject);
begin
  inherited;
  pnlDiretorio.Visible := True;
end;

procedure TFrmExportaVariosConvenios.DirectoryListBox1KeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#27 then
    pnlDiretorio.Visible := False;
end;

procedure TFrmExportaVariosConvenios.btnOkDirClick(Sender: TObject);
begin
  inherited;
  LabelNomeArqTxt.Caption := DirectoryListBox1.Directory;
  pnlDiretorio.Visible    := False;
  sGuardaDir              := LabelNomeArqTxt.Caption;
end;

procedure TFrmExportaVariosConvenios.btnSairDiretorioClick(
  Sender: TObject);
begin
  inherited;
  pnlDiretorio.Visible := False;
end;

procedure TFrmExportaVariosConvenios.chkMarcaTudoClick(Sender: TObject);
begin
  inherited;
  If chkMarcaTudo.Checked Then
  Begin
    qryLayoutEntrxSaida.Close;
    qryLayoutEntrxSaida.Sql.Clear;    
    qryLayoutEntrxSaida.Sql.Add(
    ' SELECT '+
      ' LD.IDLAYOUT, '+
      ' LD.FLGTIPOCONVENIO, '+
      ' LDS.IDLAYOUTSAIDA, '+
      ' LD.DESCRICAO AS LAYOUTENTRADA, '+
      ' LDS.DESCRICAO AS LAYOUTSAIDA, '+
      ' LES.NOMEARQ, '+
      ' 1 AS FLGENVIAR '+

    ' FROM '+
      ' LAYOUTDESCONTO LD, '+
      ' LAYOUTDESCONTOSAIDA LDS, '+
      ' LAYOUTENTRXSAIDA LES '+

    ' WHERE '+
      ' LD.IDLAYOUT       = LES.IDLAYOUTENT    AND '+
      ' LDS.IDLAYOUTSAIDA = LES.IDLAYOUTSAIDA ');
    qryLayoutEntrxSaida.Open;
  End
  Else
  Begin
    qryLayoutEntrxSaida.Close;
    qryLayoutEntrxSaida.Sql.Clear;
    qryLayoutEntrxSaida.Sql.Add(
    ' SELECT '+
      ' LD.IDLAYOUT, '+
      ' LD.FLGTIPOCONVENIO, '+
      ' LDS.IDLAYOUTSAIDA, '+
      ' LD.DESCRICAO AS LAYOUTENTRADA, '+
      ' LDS.DESCRICAO AS LAYOUTSAIDA, '+
      ' LES.NOMEARQ, '+
      ' 0 AS FLGENVIAR '+

    ' FROM '+
      ' LAYOUTDESCONTO LD, '+
      ' LAYOUTDESCONTOSAIDA LDS, '+
      ' LAYOUTENTRXSAIDA LES '+

    ' WHERE '+
      ' LD.IDLAYOUT       = LES.IDLAYOUTENT    AND '+
      ' LDS.IDLAYOUTSAIDA = LES.IDLAYOUTSAIDA ');
    qryLayoutEntrxSaida.Open;
  End;
end;

procedure TFrmExportaVariosConvenios.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana Nunes dos Santos SOL 109421  KINTANA4 496332
        LabelNomeArqTxt.Caption:=SiStema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

end;

end.

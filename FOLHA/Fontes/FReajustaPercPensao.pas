unit FReajustaPercPensao;

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
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Spin,UfuncoesFolha, Db, DBTables,
  Wwquery, Umenserro,dBaseDados,Usistema,UFuncoesUteisFB,uAdmPrevFB, Wwdatsrc,
  uReajustaPercPensao;

type
  TfrmReajustaPercPensao = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    pgcOpcoes: TPageControl;
    tbsResultado: TTabSheet;
    Panel6: TPanel;
    bbtnSavlar: TBitBtn;
    Panel7: TPanel;
    PnlProgress: TPanel;
    lblTitLote: TLabel;
    Mensagem: TLabel;
    lblPatro: TLabel;
    lblContagem: TLabel;
    ProgressBar1: TProgressBar;
    memResult: TMemo;
    bbtnPreparo: TBitBtn;
    SaveDlg: TSaveDialog;
    Label1: TLabel;
    pnlExecucoes: TPanel;
    procedure FormShow(Sender: TObject);
    procedure bbtnPreparoClick(Sender: TObject);
    procedure bbtnSavlarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sMesCobranca : String;
    wHora, wMin, wSeg, wMSeg : word;
  public
    { Public declarations }
  end;

var
  frmReajustaPercPensao: TfrmReajustaPercPensao;

implementation

{$R *.DFM}

procedure TfrmReajustaPercPensao.FormShow(Sender: TObject);
Var
  aYear, aMonth, aDay          : Word;
  sAnoAux, sMesAux, sDataFolha : string;

Begin
  inherited;
  pgcOpcoes.Visible       := False;
  bbtnPreparo.Enabled     := True;
  DecodeDate(Date, aYear, aMonth, aDay);
  If (aMonth >= 1) And (aMonth <= 12) Then
  Begin
    cmbMes.ItemIndex := aMonth - 1;
    cmbMes.Text      := cmbMes.Items[cmbMes.ItemIndex];
    spnedAno.Text    := IntToStr(aYear);
  End;
  sAnoAux := spnedAno.Text;
  If cmbMes.ItemIndex <= 8 then
    sMesAux := '0' + IntToStr(cmbMes.ItemIndex + 1)
  Else
  Begin
    If cmbMes.ItemIndex <> 12 Then
      sMesAux := IntToStr(cmbMes.ItemIndex + 1)
    Else
      sMesAux := '12';
  End;
  sMesCobranca := sAnoAux + '/' + sMesAux;
  AtualizaExecucoes(1, sMesCobranca);
  pnlExecucoes.Caption := NumExecs(sMesCobranca); 
  pnlExecucoes.Update;
  If Trim(pnlExecucoes.Caption) = '0' Then
  Begin
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
    AtualizaExecucoes(3, sMesCobranca);
    dtmBaseDados.dbBaseDados.Commit;
  end;
end;

procedure TfrmReajustaPercPensao.bbtnPreparoClick(Sender: TObject);
Var
   iInicio, iFim, nProcessados : integer;

begin
  inherited;
  If MsgDlg('Você tem certeza que deseja realizar esta operação ? (S/N) ',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes Then
  Begin

    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
    Mensagem.Caption := 'Gravando o Log de Operações';
    Mensagem.Update;
    If Not Sistema.GravaLogOperacoes('Atualização de Pensão Alimentícia para Benefíciários .') Then
      Raise Exception.Create('Não foi possível gravar o log.')
    Else
      dtmBaseDados.dbBaseDados.Commit;

    DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
    iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
    pgcOpcoes.Visible := True;
    ProcessaReajuste(sMesCobranca, memResult, Mensagem);
    DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
    iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
    memResult.Lines.Add('');
    memResult.Lines.Add('Tempo de Processamento : ' +  TempoDecorrido(iFim - iInicio));
    PnlProgress.Visible  := False;
    pgcOpcoes.ActivePage := tbsResultado;
    bbtnPreparo.Enabled  := False;
    grpMesRef.Enabled    := False;
  end;
end;

procedure TfrmReajustaPercPensao.bbtnSavlarClick(Sender: TObject);
begin
  inherited;
   if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmReajustaPercPensao.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        SaveDlg.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FREAJUSTAPERCPENSAO                                                    |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA PARA FAZER O REAJUSTE DE PERCENTUAIS DE PENSÃO ALIMENTÍCIA.           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2003 A 18/07/2003                         |
| PENDÊNCIA: 14600                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.04                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDACAO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}


unit FCadBackAutoriza;

//  01/02/2007 24363 Removido o owner do CM.
{------------------------------------------------------------------------
data     : 07.07.2006
descrição: Interface de Restauração das Autorizações Registradas no Ato da
           Importação das Autorizações.
//========================================================================
Data     : 31/01/2007
Pendencia: 24363
Descrição: Removido o owner CM. Componente CMDataTransf.PrefixoServidor
-------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCANCELAR, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, CMDataTransf, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, uMenserro, ComCtrls,
  fcStatusBar, uSistema;

type
  TfrmCadBackAutoriza = class(TfrmOkCancelar)
    Panel1: TPanel;
    wwDBGridBackAutoriza: TwwDBGrid;
    sqlBack: TCMSqlParams;
    dsBack: TwwDataSource;
    cmcdsBack: TCMClientDataSet;
    CMDataTransf: TCMDataTransf;
    MemErroImport: TMemo;
    SbTransf: TfcStatusBar;
    Pbtransf: TProgressBar;
    Panel2: TPanel;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CMDataTransfTransfProgress(const Msg: String;
      Operation: TTransfOperation; StepNum, TotalSteps: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBackAutoriza: TfrmCadBackAutoriza;

implementation

{$R *.DFM}

procedure TfrmCadBackAutoriza.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox
    ('Confirma a restauração do backup selecionado ? As autorizações atuais serão perdidas. ',
     'Restaura Autorização', mb_YesNo + mb_IconQuestion) = idNo then
     exit;


    If (not cmCdsBack.FieldByName('IDBACKCTRL').IsNull) Then
     Try
        Sistema.GravaLogOperacoes(Translate('Processamento do TransfRelatorios'));

        MemErroImport.Lines.Append(Translate('- Início do Processamento: ') + DateTimeToStr(Now));

        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled := False;
        bbtnSair.Enabled := False;
        bbtnAjuda.Enabled := False;

        // Busca o owner do banco
        if Sistema.UsuarioUnico Then
           CMDataTransf.PrefixoServidor := Sistema.Owner + '.';

        // 17382 - Restaura o backup selecionado.
        if CMDataTransf.RestoreGrants(cmcdsBack.FieldByName('IDBACKCTRL').AsInteger) then
        begin
           Sistema.GravaLogOperacoes(Translate('Autorizações Restauradas'));
           MemErroImport.Lines.Append(Translate('- Término do Processamento: ') + DateTimeToStr(Now));
           ShowMessage(Translate('Autorizações Restauradas'))
        end
        else
        begin
           Sistema.GravaLogOperacoes(Translate('Erro ao Restaurar Autorizações'));
           MemErroImport.Lines.Append(Translate('- Término do Processamento: ') + DateTimeToStr(Now));
           ShowMessage(Translate('Erro ao Restaurar as Autorizações'))
        end;
     finally
        bbtnConfirmar.Enabled := True;
        bbtnCancelar.Enabled := True;
        bbtnSair.Enabled := True;
        bbtnAjuda.Enabled := True;
     end;
end;

procedure TfrmCadBackAutoriza.FormShow(Sender: TObject);
begin
  inherited;
  sqlBack.Open;
end;

procedure TfrmCadBackAutoriza.CMDataTransfTransfProgress(const Msg: String;
  Operation: TTransfOperation; StepNum, TotalSteps: Integer);
begin
  inherited;
  If TotalSteps <> 0 Then
     Pbtransf.Max := TotalSteps;

  Pbtransf.Position := StepNum;
  SbTransf.Panels[0].Text := Msg;
end;

end.

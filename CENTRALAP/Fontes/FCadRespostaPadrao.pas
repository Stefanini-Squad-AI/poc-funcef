(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/09/2000 
*******************************************************************************)

unit FCadRespostaPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, DBCtrls, ComCtrls, wwriched, CmEventosCadastro,
  ImgList, usistema;

type
  TFrmCadRespostaPadrao = class(TfrmCadastroCS)
    qryIDRESPATEND: TFloatField;
    Label2: TLabel;
    qryDESCRESPATEN: TMemoField;
    MemResposta2: TwwDBRichEdit;
    procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadRespostaPadrao: TFrmCadRespostaPadrao;

implementation

Uses UDataBase, uMensErro, DBaseDados, FPrincipal;

{$R *.DFM}

Procedure TFrmCadRespostaPadrao.CmeCadastroDelete(Sender: TObject);
Begin
   Try
      Inherited;
   except
       If (MsgDlg('A resposta que vc deseja excluir já foi ultilizada em um atendimento ' +
                  'ou associada a um assunto. A exclusão da mesma implica na exclusão do seu ' +
                  'relacionamento ao assunto ou atendimento. Confirma a exclusão?',
                  'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
       Begin
          Try
            StartTransacao;
            ExecutarQuery(DtmBaseDados.Qry,'UPDATE ASSUNTOXATEND SET IDASSUNTOXRESP = NULL WHERE IDASSUNTOXRESP IN ' +
                                           '(SELECT IDASSUNTOXRESP FROM ASSUNTOXRESP WHERE IDRESPATEND = ' + MontaSelect.ValoresChave[0] + ')');

            ExecutarQuery(DtmBaseDados.Qry,'DELETE FROM ASSUNTOXRESP WHERE IDRESPATEND = ' + MontaSelect.ValoresChave[0]);
            CommitTransacao;
          Except
            RollbackTransacao;
          End;
          
          CmeCadastro.Confirma(Self);
       End;
   End;
End;

procedure TFrmCadRespostaPadrao.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryIDRESPATEND.AsInteger := LeUltRegistro(nil,'RESPATEND') ;
  If MemResposta2.CanFocus Then MemResposta2.SetFocus;
end;

procedure TFrmCadRespostaPadrao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If MemResposta2.CanFocus Then MemResposta2.SetFocus;
end;

procedure TFrmCadRespostaPadrao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  Begin
     with qry do
     Begin
        If Active then Close;
        If Not Prepared Then Prepare;
        Params[0].AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
        Open;
     End;
  End;
end;

procedure TFrmCadRespostaPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  MemResposta2.PlainText := True;
end;

procedure TFrmCadRespostaPadrao.CmeCadastroConfirma(Sender: TObject);
begin
  if not Sistema.GravaLogOperacoes('Operação de Cadastro de Respostas Padrão') then
  begin
    Raise Exception.Create('Não foi possível Gravar o Log');
    exit;
  end;

  inherited;
end;

end.

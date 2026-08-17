unit FCadMotivoConcessao;
//------------------------------------------------------------------------------
//Pendência   : SOL 210109/15462 Kintana 2053936
//Responsável : Higor Nayde Ferreira
//Data        : 03/10/2014
//Descrição   : Criar formulário para motivo de bloqueio e adequar cadastro de bloqueio
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, DBCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls;

const
     sSQLInsert = (' INSERT INTO CM.MOTIVOSUSPCONCESSAO                       '+
                   '  (IDMOTIVOSUSPCONCESSAO,DESCRICAO)                       '+
                   ' VALUES                                                   '+
                   '  (:IDMOTIVOSUSPCONCESSAO,:DESCRICAO)                     ');

     sSQLupd =    (' UPDATE CM.MOTIVOSUSPCONCESSAO                            '+
                   '   SET DESCRICAO =             :DESCRICAO                 '+
                   ' WHERE IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO     ');

     sSQLDelete = (' DELETE FROM CM.MOTIVOSUSPCONCESSAO                       '+
                   ' WHERE IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO     ');

type
  TfrmCadMotivoConcessao = class(TFrmCadastroGridCS)
    edtMotivo: TDBEdit;
    Label1: TLabel;
    qryAux: TwwQuery;
    qryUpd: TwwQuery;
    qryDelete: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
        procedure Insert;
    { Public declarations }
  end;

var
  frmCadMotivoConcessao: TfrmCadMotivoConcessao;

implementation
uses
 uMensErro,uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmCadMotivoConcessao.FormCreate(Sender: TObject);
begin
  inherited;
  qry.open;
end;

procedure TfrmCadMotivoConcessao.Insert;
begin
  if (qry.State in  [dsInsert])then
  begin
       qryAux.open;
       qryUpd.close;
       qryUpd.SQL.Add(sSQLInsert);
       qryUpd.ParamByName('IDMOTIVOSUSPCONCESSAO').AsInteger := qryAux.FieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger+1;
       qryUpd.ParamByName('DESCRICAO').AsString:= edtMotivo.Text;
       qryUpd.Prepare;
       qryUpd.ExecSQL;
  end
  else   if (qry.State in  [dsEdit])then
  begin
       qryUpd.close;
       qryUpd.SQL.Add(sSQLupd);
       qryUpd.ParamByName('IDMOTIVOSUSPCONCESSAO').AsInteger := qry.FieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger;
       qryUpd.ParamByName('DESCRICAO').AsString:= edtMotivo.Text;
       qryUpd.Prepare;
       qryUpd.ExecSQL;
  end;

end;

procedure TfrmCadMotivoConcessao.bbtnConfirmarClick(Sender: TObject);
begin
   if (Qry.State in [dsInsert,dsEdit]) then begin
      if (edtMotivo.Text = '') then
       begin
           MsgDlg('O motivo de bloqueio de concessão não pode ser vazio.', 'Empréstimo',
                   mtInformation, [mbOk], 0);
            Exit;
        end;
   end;
   inherited;
   qry.close;
   qry.open;
   bbtnCancelarClick(Self);

end;

procedure TfrmCadMotivoConcessao.sbtnApagarClick(Sender: TObject);
begin
  qryUpd.Close;
  qryUpd.ParamByName('IDMOTIVOSUSPCONCESSAO').AsInteger := qry.fieldByName('IDMOTIVOSUSPCONCESSAO').Asinteger;
  qryUpd.Open;

  if (not qryUpd.IsEmpty)then
  begin
      MsgDlg('Não é possível excluir motivo por haver bloqueio de concessão vinculado a ele.', 'Empréstimo',
             mtInformation, [mbOk], 0);

      CmeCadastro.AtualizaBotoes(self);
//      Exit;
  end
  else begin

  try

     if (MsgDlg('Deseja excluir motivo de bloqueio de concessão?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
        qryDelete.close;
        qryDelete.ParamByName('IDMOTIVOSUSPCONCESSAO').AsInteger := qry.fieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger;
        qryDelete.Prepare;
        qryDelete.ExecSQL;

        CommitTransacao;
     end;
   except
      RollbackTransacao;

      Raise;
      Repaint;
   end;
   //StartTransacao;
   qry.close;
   qry.open;
    //qry.FieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger := 22;
    //inherited;
  end;
  CmeCadastro.AtualizaBotoes(self);

end;

procedure TfrmCadMotivoConcessao.qryBeforePost(DataSet: TDataSet);
begin

  if (qry.state in [dsInsert])then
  begin
     qryAux.close;
     qryAux.open;
     qry.FieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger := qryAux.FieldByName('IDMOTIVOSUSPCONCESSAO').AsInteger+1;
  end;
  inherited;


end;

procedure TfrmCadMotivoConcessao.qryBeforeDelete(DataSet: TDataSet);
begin
  inherited;

   MsgDlg(qry.fieldByName('IDMOTIVOSUSPCONCESSAO').AsString, 'Empréstimo',
             mtInformation, [mbOk], 0);
end;

end.

unit FExcluiPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TfrmExcluiPgto = class(TfrmOkCancelar)
    RichEdit1: TRichEdit;
    qry: TwwQuery;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExcluiPgto: TfrmExcluiPgto;

implementation

uses uMensErro,uDataBase, DBaseDados,UModulo,uSistema,uFuncaoGeral,uDocumento,
     uLancFinanc,uLancContab,UIntegraBack;

{$R *.DFM}

procedure TfrmExcluiPgto.bbtnConfirmarClick(Sender: TObject);
var
   iCodLancFinanc:Integer;
   sSql:String;
begin
  inherited;
  //
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.text := 'SELECT L.*,R.*,D.* FROM DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R '+
                  'WHERE D.IDPESSOA = '+InttoStr(Sistema.idEmpresa)+' AND D.RECPAG = ''P'' AND '+
                  'L.OPERACAO=''5'' AND L.CODDOCUMENTO = D.CODDOCUMENTO AND L.CODDOCUMENTO = R.CODDOCUMENTO(+) AND '+
                  'L.NUMLANCTO = R.NUMLANCTO(+)';
  qry.Open;
  //
  try
     StartTransacao;
     //
     qry.First;
     While not qry.EOF do
     Begin
        if qry.FieldByName('ESTORNO').AsInteger <> 0 then
        Begin
           sSql:='UPDATE LANCTODOCUM SET ESTORNO = NULL WHERE CODDOCUMENTO = '+qry.FieldByName('CODDOCUMENTO').AsString+
                 ' AND NUMLANCTO = '+qry.FieldByName('NUMLANCTO').AsString;
           ExecutarQuery(qryAux,sSql);
        end;
        qry.Next;
     end;
     //
     qry.First;
     While not qry.EOF do
     Begin
        Documento.Excluir(qryaux,qry.FieldByName('CODDOCUMENTO').AsInteger,qry.FieldByName('NUMLANCTO').AsInteger);
        qry.Next;
     end;
     //
     qry.First;
     While not qry.EOF do
     Begin
        if qry.FieldByName('CODLANCFINANC').AsInteger <> 0 then
        Begin
           iCodLancFinanc:=qry.FieldByName('CODLANCFINANC').AsInteger;
           LancFinanc.ExcluiFinanceiro(iCodLancFinanc);
        end;
        if qry.FieldByName('NUMLOTE').AsInteger <> 0 then
        Begin
           sSql:='DELETE LOTEXDOCUM WHERE NUMLOTE = '+qry.FieldByName('NUMLOTE').AsString+' AND '+
                 ' CODDOCUMENTO = '+qry.FieldByName('CODDOCUMENTO').AsString;
           ExecutarQuery(qryAux,sSql);
        end;
        qry.next;
     end;
     //
     qry.First;
     While not qry.EOF do
     Begin
        if qry.FieldByName('PLNCODIGO').AsInteger <> 0 then
           ExcluiLanc (true,qry.FieldByName('PLNCODIGO').AsInteger,'BASEDADOS',
                       '3',IntegraBack.Plano, Sistema.idEmpresa,Sistema.IdUsuario,false,0,IntegraBack.MascaraPlano);
        qry.next;
     end;
     CommitTransacao;
     MsgDlg('Exclusão Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
     Funcaogeral.TiraIcone;
  except
     RollBackTransacao;
     MsgDlg('Exclusão Efetuada com Sucesso','Erro',mtError,[mbOk],0);
     Funcaogeral.TiraIcone;
     raise;
  end;
end;

end.

unit FAcertaEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmAcertaEntrada = class(TfrmSairAjuda)
    gbData: TGroupBox;
    deData: TCMDateTimePicker;
    bbtnAcertar: TBitBtn;
    qryMov: TwwQuery;
    qryItens: TwwQuery;
    qryAux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnAcertarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcertaEntrada: TfrmAcertaEntrada;

implementation

Uses uSistema,uMensErro,uFuncaoGeral,uDataBase,uModulo;
{$R *.DFM}
                             
procedure TfrmAcertaEntrada.FormActivate(Sender: TObject);
begin
  inherited;
  deData.Date := Date;
end;

procedure TfrmAcertaEntrada.bbtnAcertarClick(Sender: TObject);
var sValorMov,sSql,sIdMov,sDatAnt:String;
begin
  inherited;
  if trim(deData.Text) = '' then begin
     MsgDlg('Obrigatório preencher a data','Erro',MtError,[mbOk],0);
     deData.SetFocus;
     exit;
  end;
  bbtnAcertar.Enabled := False;
  //
  qryMov.Close;
  qryMov.ParamByName('IDPESSOA').AsInteger:= Sistema.IdEmpresa;
  qryMov.ParamByName('DATAMOV').AsString  := deData.Text;
  qryMov.Open;
  //
  Try
     StartTransacao;
     sDatAnt:=DateToStr(Modulo.LeDataRepresa);
     sIdMov :=sDatAnt;
     sSql:='UPDATE PARALMOX SET DATAREPRESA = TO_DATE('''+DateToStr((deData.Date-1))+''',''DD/MM/YYYY'') ';
     sSql:=sSql+' WHERE IDPESSOA = '+IntToStr(Sistema.idEmpresa);
     if not ExecutarQuery(qryAux,sSql) then
        Abort;
     qryMov.First;
     While not qryMov.EOF do begin
        sIdMov:=qryMov.FieldByName('IDMOV').AsString;
        qryItens.Close;
        qryItens.ParamByName('IDMOV').AsFloat:= qryMov.FieldByName('IDMOV').AsFloat;
        qryItens.Open;
        if not qryItens.IsEmpty then begin
           if qryMov.FieldByName('CODTIPOMOV').AsString = 'A' then begin
              sValorMov:=FuncaoGeral.OraNumero(qryItens.FieldByName('VLRESTOQUE').AsFloat);
           end else begin
              sValorMov:=FuncaoGeral.OraNumero((abs(qryItens.FieldByName('VLRESTOQUE').AsFloat)*(-1)));
           end;
           sSql:='UPDATE MOVIMENT SET VALORMOV = '+sValorMov;
           sSql:=sSql+' WHERE IDMOV = '+qryMov.FieldByName('IDMOV').AsString;
           if not ExecutarQuery(qryAux,sSql) then
              Abort;
        end;
        qryMov.Next;
     end;
     MsgDlg('Acerto Efetuado com Sucesso. Retorne a Data Represa para '+sDatAnt,'Aviso',MtWarning,[mbOk],0);
     CommitTransacao;
  Except
     RollBackTransacao;
     MsgDlg('Gravação não Efetuada '+sIdMov,'Erro',MtError,[mbOk],0);
  end;
  bbtnAcertar.Enabled := true;
end;

end.

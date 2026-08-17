unit FCorrigeDocumentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FProcuraCliFor, Db, DBTables, wwdbdatetimepicker,
  CMDateTimePicker, CMProcuraSubTipo, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlJurosCorrecao, uctrlPadroes;

type
  TFrmCorrigeDocumentoMT = class(TFrmProcuraCliFor)
    GroupBox1: TGroupBox;
    DtAberto: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    DtCorrecao: TCMDateTimePicker;
    sqlDocs: TCMSqlParams;
    cdsDocs: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCorrigeDocumentoMT: TFrmCorrigeDocumentoMT;
  JurosCorrecao : TCtrlJurosCorrecao; //andre tavares - pendência 19580 - 27/06/2006

implementation

Uses uSistema, uMensErro, uDataBase, uCtrlParamIntegra;

{$R *.DFM}

procedure TFrmCorrigeDocumentoMT.bbtnConfirmarClick(Sender: TObject);
var iDocsCorrigidos: integer;
begin
  inherited;
  iDocsCorrigidos := 0;
  if DtCorrecao.Text = '' then
     MsgDlg('Favor indicar a Data da Correção','Atenção',mtError,[mbOK],0)
  else
  begin
    try
      JurosCorrecao := TCtrlJurosCorrecao.Create; //andre tavares - pendência 19580 - 27/06/2006
      JurosCorrecao.InitializeAs(padroes); //andre tavares - pendência 19580 - 27/06/2006
      sqlDocs.SQL.Clear;                   //andre tavares - pendência 19580 - 27/06/2006
      with sqlDocs.SQL do
      begin
        Append('SELECT D.CODDOCUMENTO');
        Append('FROM');
        Append(' DOCUMENTO D');
        Append('WHERE');
        Append('((RTRIM(D.STATUS) <> ''2'') OR (D.STATUS IS NULL)) AND');
        Append('(D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND ');

        Append(' D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
        Append('   and not exists  (select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr(ParamIntegra.RecPag));
        Append(' and b.idusuario = ' + IntToStr(Sistema.IDUsuario) + ') ');
        Append(' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ' + QuotedStr(ParamIntegra.RecPag));
        Append('  and exists (select 1 from UsuarioxTpdocto b where recpag = ' + QuotedStr(ParamIntegra.RecPag));
        Append(' and a.codtipdoc=b.codtipdoc and b.idusuario = ' + inttostr(sistema.idusuario)+')) and ');

        if CPForCli.Text <> '' then
          Append('(D.IDFORCLI = ' + IntToStr(CPForCli.ForCliReg.Id) + ') AND ');
        if DtAberto.Text <> '' Then
          Append('(D.DATAPROGRAMADA <= TO_DATE(''' + DtAberto.Text + ''',''DD/MM/YYYY'')) AND ');
        Append('(D.RECPAG = ' + QuotedStr(ParamIntegra.RecPag) + ')');
      end;
      sqlDocs.Open;

      if not cdsDocs.IsEmpty then
      begin
        while not cdsDocs.Eof do
        begin
          JurosCorrecao.CodDocumento := cdsDocs.FieldByName('CODDOCUMENTO').AsInteger;
          JurosCorrecao.DataCorrecao := DtCorrecao.Date;

          if JurosCorrecao.CorrigeDocumento then //andre tavares - pendência 19580 - 27/06/2006
            inc(iDocsCorrigidos);

          cdsDocs.Next;
        end;
        MsgDlg(intToStr(iDocsCorrigidos) +' Documentos Corrigidos Com Sucesso.','Atenção',mtInformation,[mbOK],0);
      end
      else //andre tavares - pendência 19580 - 27/06/2006
        MsgDlg('Não Há Documentos a Serem Corrigidos','Atenção',mtInformation,[mbOK],0);

      JurosCorrecao.Free;
    except
      MsgDlg('Erro ao corrigir documentos','Atenção',mtError,[mbOK],0);
      JurosCorrecao.Free;
      Raise;
    end;
  end;
end;

end.

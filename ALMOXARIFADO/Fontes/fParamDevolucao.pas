unit fParamDevolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, wwdblook, StdCtrls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamDevolucao = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    dblkcmbAlmox: TwwDBLookupCombo;
    Label4: TLabel;
    qryAlmox: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamDevolucao: TfrmParamDevolucao;

implementation

uses DRelatoriosAlmox, usistema;

{$R *.DFM}

procedure TfrmParamDevolucao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmRelatoriosAlmox.qryDevolucao.Close;
  dtmRelatoriosAlmox.qryDevolucao.Sql.Text :=
' SELECT '+
'   AL.DESCALMOX AS ALMOXARIFADO, '+
'   P.NOME AS FORNECEDOR, '+
'   NF.DATAENTDEVOL AS DATAEMISNF, '+
'   DECODE(NF.COMPLNF,'''',TO_CHAR(NF.NUMNF), RTRIM(TO_CHAR(NF.NUMNF),'' '')||''/''||NF.COMPLNF) AS NNF, '+
'   AR.CODARTIGO, '+
'   SUBSTR(DECODE(IT.IDPRODVARI,NULL,PR.DESCPROD||'' ''||RTRIM(AR.CODCOR,'' '') ||'' ''|| RTRIM(AR.CODTAMANHO),PV.DESCPRODVARI),1,60 ) AS PRODUTO, '+
'   IT.QTDERECEBDEVOL, '+
'   NF.VLRNOTAFISCAL,  '+
'   IT.VLRUNITARIO, '+
'   (IT.QTDERECEBDEVOL*IT.VLRUNITARIO) AS VALORTOTAL, '+
'   ((IT.QTDERECEBDEVOL*IT.VLRUNITARIO) - IT.VLRESTOQUE) AS ACDES, '+
'   IT.VLRESTOQUE '+
' FROM ALMOX AL, ARTIGO AR, PRODUTO PR, ITENSRECEBDEVOL IT, NFRECEBDEVOL NF, PESSOA P,PRODVARI PV '+
' WHERE '+
'       (NF.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'+
'   AND (NF.DATAENTDEVOL >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))'+
'   AND (NF.DATAENTDEVOL <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY''))';
    if Trim(dblkcmbAlmox.text ) <> '' then
       dtmRelatoriosAlmox.qryDevolucao.SQL.add(' AND (AL.CODALMOXARIFADO = '+dblkcmbAlmox.LookupValue+')');
    dtmRelatoriosAlmox.qryDevolucao.SQL.Add(
'   AND (FLGTIPONOTA = ''D'') '+
'   AND (NF.IDFORCLI = P.IDPESSOA) '+
'   AND (IT.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL) '+
'   AND (IT.CODALMOXARIFADO = AL.CODALMOXARIFADO) '+
'   AND (IT.CODARTIGO = AR.CODARTIGO) '+
'   AND (AR.CODPRODUTO = PR.CODPRODUTO) '+
'   AND (PV.IDPRODVARI(+) = IT.IDPRODVARI) '+
' ORDER BY ALMOXARIFADO,DATAEMISNF, FORNECEDOR, NNF ');
  dtmRelatoriosAlmox.lbDataDevolucao.caption := deDataInicial.Text+ ' à ' + deDataFinal.Text;
end;

procedure TfrmParamDevolucao.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
//
  qryAlmox.Close;
  qryAlmox.SQL.Text:= ' SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')' +
                      ' ORDER BY DESCALMOX ';
  qryAlmox.Open;
//
end;

end.

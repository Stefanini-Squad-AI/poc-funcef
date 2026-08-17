unit FParamCadSolPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti;

type
  TFrmParamCadSolPrePronta = class(TfrmOkCancelar)
    GrpPre: TGroupBox;
    qrySolPre: TwwQuery;
    dblcSolPre: TCMDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
  public
    { Public declarations }
  end;

var
  FrmParamCadSolPrePronta: TFrmParamCadSolPrePronta;

implementation

{$R *.DFM}

Uses  DRptRelats, uMensErro;

Procedure TFrmParamCadSolPrePronta.Fazqry;
Begin
    //
    With DtmRptRelats.qryCadSolPrePronta Do
       Begin
           Close;
           Sql.Text :=' SELECT '+
                      '      I.IDSCPREPRONTA,   '+
                      '      S.DESCSCPREPRONTA, '+
                      '      G.CODGRUPOPROD,    '+
                      '      G.DESCGRUPOPROD,   '+
                      '      I.CODARTIGO, '+
                      '      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)  AS DESCRICAO, '+
                      '      SA.SALDOQTDE, '+
                      '      I.QTDEPESSOA, '+
                      '      I.CODMEDIDA,  '+
                      '      P.CODMEDCUSTO AS UNIDSALDO '+
                      ' FROM '+
                      '      SCPREPRONTA S, '+
                      '      ITEMSCPREPRONTA I, '+
                      '      ARTIGO A, '+
                      '      PRODUTO P,  '+
                      '      GRUPPROD G, '+
                      '      SALDO SA '+
                      ' WHERE '+
                      '       (S.IDSCPREPRONTA = I.IDSCPREPRONTA) ';
           If Trim(dblcSolPre.Text) <> '' Then
              Sql.Add('   AND ( I.IDSCPREPRONTA =  '+ dblcSolPre.LookupValue +') ');

              Sql.Add('   AND (I.CODARTIGO = A.CODARTIGO) '+
                      '   AND (A.CODPRODUTO = P.CODPRODUTO) '+
                      '   AND (P.CODGRUPOPROD = G.CODGRUPOPROD) '+
                      '   AND (S.IDPESSOA = SA.IDPESSOA) '+
                      '   AND (S.CODALMOXARIFADO = SA.CODALMOXARIFADO) '+
                      '   AND (A.CODARTIGO = SA.CODARTIGO) '+
                      ' ORDER BY I.IDSCPREPRONTA,G.CODGRUPOPROD,DESCRICAO');

          Open;
          First;
       End;
End;
procedure TFrmParamCadSolPrePronta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamCadSolPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  qrySolPre.Close;
  qrySolPre.Open;
end;

end.

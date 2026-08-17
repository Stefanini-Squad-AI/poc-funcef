unit FParamSolPrePronta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, DBTables, Db, Wwquery, ComCtrls, TREdit,
  IvDictio, IvMulti, IvEMulti;

type
  TFrmParamSolPrePronta = class(TfrmOkCancelar)
    qrySoli: TwwQuery;
    GroupBox1: TGroupBox;
    dblcSoli: TCMDBLookupCombo;
    RgSoli: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RgSoliClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;

  public
    { Public declarations }
  end;

var
  FrmParamSolPrePronta : TFrmParamSolPrePronta;
  iNumSoli             : Integer;
implementation

{$R *.DFM}
Uses DRelCompras, uMensErro, uSistema, uModulo, DBaseDados;

Procedure TFrmParamSolPrePronta.Fazqry;
Begin
   With DtmRelCompras.qrySolPrePronta Do
      Begin
           Close;
           Sql.Clear;
           Sql.Append(' SELECT ');
           Sql.Append('      I.NUMSOLCOMPRA,  ');
           Sql.Append('      G.CODGRUPOPROD,  ');
           Sql.Append('      G.DESCGRUPOPROD, ');
           Sql.Append('      I.CODARTIGO,     ');
           Sql.Append('      NF.VLRUNITARIO,  ');
           Sql.Append('      NF.DATAENTDEVOL AS DATAULT, ');
           Sql.Append('      SA.SALDOQTDE, ');
           Sql.Append('      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)  AS DESCRICAO, ');
           Sql.Append('      I.QTDEPEDIDA, ');
           Sql.Append('      I.CODMEDIDA, ');
           Sql.Append('      P.CODMEDCUSTO AS UNIDSALDO, ');
           Sql.Append('      NF.NOME ');
           Sql.Append(' FROM ');
           Sql.Append('      SOLICOMP S, ');
           Sql.Append('      ITEMSOLI I, ');
           Sql.Append('      ARTIGO A,   ');
           Sql.Append('      PRODUTO P,  ');
           Sql.Append('      GRUPPROD G, ');
           Sql.Append('      SALDO SA,   ');
           Sql.Append('      ( SELECT ');
           Sql.Append('               I.CODARTIGO, ');
           Sql.Append('               I.VLRUNITARIO, ');
           Sql.Append('               P.NOME, ');
           Sql.Append('               N.DATAENTDEVOL ');
           Sql.Append('        FROM ');
           Sql.Append('              PESSOA P, ');
           Sql.Append('              NFRECEBDEVOL N, ');
           Sql.Append('              ITENSRECEBDEVOL I, ');
           Sql.Append('              ( SELECT ');
           Sql.Append('                     MAX(IDITENSRECDEV), ');
           Sql.Append('                     CODARTIGO ');
           Sql.Append('                FROM ');
           Sql.Append('                     ITENSRECEBDEVOL ');
           Sql.Append('                GROUP BY CODARTIGO ) AUX ');
           Sql.Append('       WHERE ');
           Sql.Append('             (I.CODARTIGO = AUX.CODARTIGO) ');
           Sql.Append('         AND (N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL) ');
           Sql.Append('         AND (P.IDPESSOA = N.IDFORCLI) ) NF ');
           Sql.Append(' WHERE ');
           Sql.Append('     (S.FLGPREPRONTA = ''S'') ');
           If RgSoli.itemindex = 0 Then
             sql.add(' AND (S.IMPRESSO = ''F'') ')
           else
             sql.add(' AND (S.IMPRESSO = ''T'') ');
           If (dblcSoli.Text) <> '' Then
             sql.add(' AND (S.NUMSOLCOMPRA = '+ dblcSoli.LookupValue +') ');

             sql.add(' AND (P.CODGRUPOPROD = G.CODGRUPOPROD) ');
             sql.add(' AND (A.CODPRODUTO = P.CODPRODUTO)     ');
             sql.add(' AND (S.NUMSOLCOMPRA = I.NUMSOLCOMPRA) ');
             sql.add(' AND (I.CODARTIGO = A.CODARTIGO)  ');
             sql.add(' AND (I.CODARTIGO = SA.CODARTIGO(+)) ');
             sql.add(' AND (S.CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) +')');
             sql.add(' AND (SA.CODALMOXARIFADO(+) = '+ IntToStr(Modulo.icodAlmoxa) +')');
             sql.add(' AND (I.CODARTIGO = NF.CODARTIGO(+)) ');
             sql.add(' ORDER BY S.NUMSOLCOMPRA,G.CODGRUPOPROD, DESCRICAO ');
           Open;
           If (dblcSoli.Text) <> '' Then
              iNumSoli := StrToInt(dblcSoli.LookupValue);
      End;

End;

procedure TFrmParamSolPrePronta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Fazqry;
end;

procedure TFrmParamSolPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  iNumSoli := 0;
  RgSoli.OnClick(Self);
end;

procedure TFrmParamSolPrePronta.RgSoliClick(Sender: TObject);
begin
  inherited;
  Case  RgSoli.ItemIndex Of
      0 : Begin
              qrySoli.Close;
              qrySoli.Sql.Text := ' SELECT '+
                                  '     NUMSOLCOMPRA,'+
                                  '     DATAENTREGA, '+
                                  '     IMPRESSO '+
                                  ' FROM '+
                                  '     SOLICOMP '+
                                  ' WHERE '+
                                  '      (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')'+
                                  '  AND (CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) +')'+
                                  '  AND (FLGPREPRONTA = ''S'')'+
                                  '  AND (IMPRESSO = ''F'') ';
               qrySoli.Open;
          End;
      1 : Begin
              qrySoli.Close;
              qrySoli.Sql.Text := ' SELECT '+
                                  '     NUMSOLCOMPRA,'+
                                  '     DATAENTREGA, '+
                                  '     IMPRESSO '+
                                  ' FROM '+
                                  '      SOLICOMP '+
                                  ' WHERE '+
                                  '      (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')'+
                                  '  AND (CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) +')'+
                                  '  AND (FLGPREPRONTA = ''S'')'+
                                  '  AND (IMPRESSO = ''T'') ';
               qrySoli.Open;
          End;
  End;

end;

end.

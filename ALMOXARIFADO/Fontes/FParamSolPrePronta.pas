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
Uses DRptRelats, uMensErro, uSistema, uModulo, DBaseDados;

Procedure TFrmParamSolPrePronta.Fazqry;
Begin
   With DtmRptRelats.qrySolPrePronta Do
      Begin
           Close;
           Sql.Text:=' SELECT '+
                     '      I.NUMSOLCOMPRA,  '+
                     '      G.CODGRUPOPROD,  '+
                     '      G.DESCGRUPOPROD, '+
                     '      I.CODARTIGO,     '+
                     '      NF.VLRUNITARIO,  '+
                     '      NF.DATAENTDEVOL AS DATAULT, '+
                     '      SA.SALDOQTDE, '+
                     '      (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO)  AS DESCRICAO, '+
                     '      I.QTDEPEDIDA, '+
                     '      I.CODMEDIDA, '+
                     '      P.CODMEDCUSTO AS UNIDSALDO, '+
                     '      NF.NOME '+
                     ' FROM '+
                     '      SOLICOMP S, '+
                     '      ITEMSOLI I, '+
                     '      ARTIGO A,   '+
                     '      PRODUTO P,  '+
                     '      GRUPPROD G, '+
                     '      SALDO SA,   '+
                     '      ( SELECT '+
                     '               I.CODARTIGO, '+
                     '               I.VLRUNITARIO, '+
                     '               P.NOME, '+
                     '               N.DATAENTDEVOL '+
                     '        FROM '+
                     '              PESSOA P, '+
                     '              NFRECEBDEVOL N, '+
                     '              ITENSRECEBDEVOL I, '+
                     '              ( SELECT '+
                     '                     MAX(IDITENSRECDEV), '+
                     '                     CODARTIGO '+
                     '                FROM '+
                     '                     ITENSRECEBDEVOL '+
                     '                GROUP BY CODARTIGO ) AUX '+
                     '       WHERE '+
                     '             (I.CODARTIGO = AUX.CODARTIGO) '+
                     '         AND (N.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL) '+
                     '         AND (P.IDPESSOA = N.IDFORCLI) ) NF '+
                     ' WHERE '+
                     '     (S.FLGPREPRONTA = ''S'') ';
           If RgSoli.itemindex = 0 Then
             sql.add(' AND (S.IMPRESSO = ''F'') ')
           else
             sql.add(' AND (S.IMPRESSO = ''T'') ');
           If (dblcSoli.Text) <> '' Then
             sql.add(' AND (S.NUMSOLCOMPRA = '+ dblcSoli.LookupValue +') ');

             sql.add(' AND (P.CODGRUPOPROD = G.CODGRUPOPROD) '+
                     ' AND (A.CODPRODUTO = P.CODPRODUTO)     '+
                     ' AND (S.NUMSOLCOMPRA = I.NUMSOLCOMPRA) '+
                     ' AND (I.CODARTIGO = A.CODARTIGO)  '+
                     ' AND (I.CODARTIGO = SA.CODARTIGO) '+
                     ' AND (S.CODALMOXARIFADO = SA.CODALMOXARIFADO) '+
                     ' AND (I.CODARTIGO = NF.CODARTIGO(+)) '+
                     ' ORDER BY S.NUMSOLCOMPRA,G.CODGRUPOPROD, DESCRICAO ');
            Open;
         If Trim(dblcSoli.Text) <> '' Then
            iNumSoli := StrToInt(dblcSoli.LookupValue);
      End;

End;

procedure TFrmParamSolPrePronta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   ModalResult := mrOk;
   Fazqry;

end;

procedure TFrmParamSolPrePronta.FormCreate(Sender: TObject);
begin
  inherited;
  iNumSoli := 0;
  //
  qrySoli.Close;
  qrySoli.Sql.Text :=' SELECT '+
                     '     NUMSOLCOMPRA,'+
                     '     DATAENTREGA, '+
                     '     IMPRESSO '+
                     ' FROM '+
                     '      SOLICOMP '+
                     ' WHERE '+
                     '      (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +')'+
                     '  AND (CODALMOXARIFADO = '+ IntToStr(Modulo.icodAlmoxa) +')'+
                     '  AND (FLGPREPRONTA = ''S'')'+
                     '  AND (IMPRESSO = ''F'') ';
  qrySoli.Open;

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

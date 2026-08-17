unit FParamArtxConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, CMDBLookupCombo, IvDictio, IvMulti, IvEMulti;

type
  TFrmParamArtxConta = class(TfrmOkCancelar)
    dblcGrp: TCMDBLookupCombo;
    qryGrupo: TwwQuery;
    Label1: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }

  end;

var
  FrmParamArtxConta: TFrmParamArtxConta;

implementation

{$R *.DFM}
Uses DRptRelats, uModulo, uSistema,uIntegraBack;

Procedure TFrmParamArtxConta.FazQry;
Begin//
   With DtmRptRelats.qryArtxConta Do
      Begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT                ');
          Sql.Add('     UN.CODARTIGO,    ');
          Sql.Add('     UN.DESCRICAO,    ');
          Sql.Add('     UN.CODGRUPOPROD, ');
          Sql.Add('     UN.DESCGRUPO,    ');
          Sql.Add('     UN.CONTAENTRADA, ');
          Sql.Add('     UN.CONTASAIDA,   ');
          Sql.Add('     UN.CENTCUST      ');
          Sql.Add('FROM                  ');
          Sql.Add('   (SELECT            ');
          Sql.Add('        A.CODARTIGO,  ');
          Sql.Add('        (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO, ');
          Sql.Add('        G.CODGRUPOPROD,  ');
          Sql.Add('        (RTRIM(G.CODGRUPOPROD) || ''  '' || G.DESCGRUPOPROD) AS DESCGRUPO, ');
          Sql.Add('        (C.CONTAENTRADA || ''  '' || PC.PLANOME ) AS CONTAENTRADA, ');
          Sql.Add('        (C.CONTASAIDA || ''  '' || PC2.PLANOME ) AS CONTASAIDA, ');
          Sql.Add('        (C.CODCENTROCUSTO ||''  '' || CC.NOME ) AS CENTCUST     ');
          Sql.Add('    FROM ');
          Sql.Add('        ARTIGO A, ');
          Sql.Add('        PRODUTO P, ');
          Sql.Add('        GRUPPROD G, ');
          Sql.Add('        ARTXCONTAXCC C, ');
          Sql.Add('        PLANOCONTA PC, ');
          Sql.Add('        PLANOCONTA PC2, ');
          Sql.Add('        CENTCUST  CC ');
          Sql.Add('    WHERE ');
          Sql.Add('          (C.IDPESSOA = '+IntToStr(sistema.idempresa)+')');
          Sql.Add('      AND (PC.PLANO = C.PLANO)  ');
          Sql.Add('      AND (PC2.PLANO = C.PLANO)   ');
          Sql.Add('      AND (A.CODPRODUTO = P.CODPRODUTO) ');
          Sql.Add('      AND (P.CODGRUPOPROD = G.CODGRUPOPROD)  ');
          Sql.Add('      AND (A.CODARTIGO = C.CODARTIGO)        ');
          Sql.Add('      AND (C.CONTAENTRADA = PC.PLACONTA)     ');
          Sql.Add('      AND (C.CONTASAIDA = PC2.PLACONTA)      ');
          Sql.Add('      AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) ');
          Sql.Add('      AND (C.IDEMPRESA = CC.IDEMPRESA(+))           ');
          Sql.Add('   UNION                                            ');
          Sql.Add('    SELECT                                          ');
          Sql.Add('        A.CODARTIGO,                                ');
          Sql.Add('        (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO, ');
          Sql.Add('        G.CODGRUPOPROD, ');
          Sql.Add('        (RTRIM(G.CODGRUPOPROD) || ''  '' || G.DESCGRUPOPROD) AS DESCGRUPO, ');
          Sql.Add('        (C.CONTAENTRADA || ''  '' || PC.PLANOME ) AS CONTAENTRADA,         ');
          Sql.Add('        (C.CONTASAIDA || ''  ''  || PC2.PLANOME ) AS CONTASAIDA,           ');
          Sql.Add('        (C.CODCENTROCUSTO ||''  '' || CC.NOME ) AS CENTCUST                ');
          Sql.Add('    FROM                                                                   ');
          Sql.Add('        ARTIGO A,                                                          ');
          Sql.Add('        PRODUTO P,                                                         ');
          Sql.Add('        GRUPPROD G,                                                        ');
          Sql.Add('        ARTXCONTAXCC C,                                                    ');
          Sql.Add('        PLANOCONTA PC,                                                     ');
          Sql.Add('        PLANOCONTA PC2,                                                    ');
          Sql.Add('        CENTCUST  CC                                                       ');
          Sql.Add('    WHERE                                                                  ');
          Sql.Add('           (C.IDPESSOA = '+IntToStr(sistema.idempresa)+')                  ');
          Sql.Add('       AND (PC.PLANO = C.PLANO)                                            ');
          Sql.Add('       AND (PC2.PLANO = C.PLANO)                                           ');
          Sql.Add('       AND (A.CODPRODUTO = P.CODPRODUTO)                                   ');
          Sql.Add('       AND (P.CODGRUPOPROD = G.CODGRUPOPROD)                               ');
          Sql.Add('       AND (G.CODGRUPOPROD = C.CODGRUPOPROD)                               ');
          Sql.Add('       AND (C.CONTAENTRADA = PC.PLACONTA)                                  ');
          Sql.Add('       AND (C.CONTASAIDA = PC2.PLACONTA)                                   ');
          Sql.Add('       AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))                       ');
          Sql.Add('       AND (C.IDEMPRESA = CC.IDEMPRESA(+))                                 ');
          Sql.Add('       AND NOT EXISTS (SELECT X.IDARTXCONTAXCC FROM ARTXCONTAXCC X         ');
          Sql.Add('                       WHERE  (X.CODARTIGO = A.CODARTIGO) )                ');
          Sql.Add('  ) UN ');
         If Trim(dblcGrp.Text)  <> '' Then
             Sql.Add(' WHERE (RTRIM(UN.CODGRUPOPROD) LIKE '''+dblcGrp.LookupValue+''' || ''%'' )');
             Sql.Add(' ORDER BY UN.CODGRUPOPROD,UN.DESCRICAO ');

          Open;
      End;
End;

procedure TFrmParamArtxConta.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamArtxConta.FormCreate(Sender: TObject);
begin
  inherited;
  qryGrupo.Open;
end;

end.

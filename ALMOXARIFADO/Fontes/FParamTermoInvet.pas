unit FParamTermoInvet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls,
  ppComm, ppCache, ppDB, ppDBBDE;

type
  TFrmParamTermoInvent = class(TfrmOkCancelar)
    RgItem: TRadioGroup;
    RgOrdem: TRadioGroup;
    qryTermo: TwwQuery;
    qryTermoFLGABREFECHA: TStringField;
    qryTermoTEXTO: TMemoField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamTermoInvent: TFrmParamTermoInvent;

implementation

uses DRptRelats, uSistema;

{$R *.DFM}
procedure TFrmParamTermoInvent.FazQry;
Begin
   DtmRptRelats.LbDataAbre.Caption  := '  '+DateToStr(Date)+'  ' ;
   qryTermo.First;
   While Not qryTermo.Eof Do
     Begin
        if qryTermo.FieldByName('FLGABREFECHA').asString = 'A' Then
           DtmRptRelats.memAbre.RichText  := qryTermo.FieldByName('TEXTO').asString
        Else
           DtmRptRelats.memFecha.RichText := qryTermo.FieldByName('TEXTO').asString;
        qryTermo.Next;
     End;
   With DtmRptRelats.qryTermoInvent Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                       ');
         Sql.Add('      A.CODARTIGO,                                                            ');
         Sql.Add('      P.CODMEDCUSTO,                                                          ');
         Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,');
         Sql.Add('      DECODE(CM.SALDO,NULL,0,CM.SALDO) AS SALDO,                              ');
         Sql.Add('      DECODE(CM.VALOR,NULL,0,CM.VALOR) AS VALOR                               ');
         Sql.Add(' FROM                                                                         ');
         Sql.Add('     ARTIGO A,                                                                ');
         Sql.Add('     PRODUTO P,                                                               ');
         Sql.Add('     ( SELECT                                                                 ');
         Sql.Add('          CODARTIGO,                                                          ');
         Sql.Add('          SUM(SALDOQTDEUC) AS SALDO,                                          ');
         Sql.Add('          SUM(CUSTOMEDIO * SALDOQTDEUC) AS VALOR                              ');
         Sql.Add('       FROM                                                                   ');
         Sql.Add('         CUSTOMED                                                             ');
         Sql.Add('       GROUP BY CODARTIGO                                                     ');
         Sql.Add('      ) CM                                                                    ');
         Sql.Add(' WHERE                                                                        ');
         Sql.Add('      (A.CODPRODUTO = P.CODPRODUTO)                                           ');
         Case RgItem.ItemIndex Of
           0 : Sql.Add('  AND (A.CODARTIGO   = CM.CODARTIGO(+))   ');
           1 : Sql.Add('  AND (A.CODARTIGO   = CM.CODARTIGO)      ');
         End;
         Case RgOrdem.ItemIndex Of
           0 : Sql.Add('ORDER BY (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR)  ');
           1 : Sql.Add('ORDER BY A.CODARTIGO ');
         End;
         Open;
      End;
End;

procedure TFrmParamTermoInvent.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamTermoInvent.FormCreate(Sender: TObject);
begin
  inherited;
  qryTermo.Close;
  qryTermo.Params[0].AsInteger := Sistema.IdEmpresa;
  qryTermo.Open;
end;

end.

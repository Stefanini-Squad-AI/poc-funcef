{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência    : 27508
Responsável  : Daniel Simões
Data         : 03/03/2008
Descrição    : Ajustes no Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fExecAssociaDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, mContrato,
  Db, DBTables, Wwquery, Wwdatsrc, mProposta;

type
  TfrmExecAssociaDoc = class(TfrmSairAjudaImob)
    Panel1: TPanel;
    Label1: TLabel;
    dbcboReceita: TwwDBLookupCombo;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    sbtnAssociar: TSpeedButton;
    sbtnCancelar: TSpeedButton;
    dsParc: TwwDataSource;
    qryParc: TwwQuery;
    dsDocs: TwwDataSource;
    qryDocs: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcNUMPARCELA: TFloatField;
    qryParcIDLOCATARIO: TFloatField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcVLRPRESTACAO: TFloatField;
    qryDocsCODDOCUMENTO: TFloatField;
    qryDocsDATAVENCIMENTO: TDateTimeField;
    qryDocsVLR_LANC: TFloatField;
    qryReceita: TwwQuery;
    qryReceitaIDTIPOCUSTORECIMO: TFloatField;
    qryReceitaDESCCUSTORECIMO: TStringField;
    sbAbrir: TSpeedButton;
    molProposta1: TmolProposta;
    updParc: TUpdateSQL;
    rgRelacao: TRadioGroup;
    rgTipoAssocia: TRadioGroup;
    qryDocsNODOCUMENTO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure sbAbrirClick(Sender: TObject);
    procedure sbtnAssociarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure sbtnCancelarClick(Sender: TObject);
    procedure DBgrdBemOriginalCellChanged(Sender: TObject);
    procedure rgTipoAssociaClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbreTabelas;
    procedure MontaSqlDocAdminImob;
    procedure MontaSqlDocCaR;

  public
    { Public declarations }
  end;

var
  frmExecAssociaDoc: TfrmExecAssociaDoc;

implementation

uses UFuncoesImob, uMensErro, uDatabase, dBaseDados, DFinanciamento;


{$R *.DFM}

procedure TfrmExecAssociaDoc.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;


procedure TfrmExecAssociaDoc.FormCreate(Sender: TObject);
begin
  inherited;
  qryReceita.Open;
end;

procedure TfrmExecAssociaDoc.AbreTabelas;
begin
   LimpaParametros( qryParc );
   qryParc.ParamByName('PIDCOMPRADOR').AsInteger := molProposta1.iComprador;
   qryParc.ParamByName('PIDLOCATARIO').AsInteger := molProposta1.iComprador;
   qryParc.Open;

   if rgTipoAssocia.ItemIndex = 0 then
   begin
      MontaSqlDocAdminImob;
      LimpaParametros( qryDocs );
      if rgRelacao.ItemIndex = 0 then begin
         qryDocs.ParamByName('PIDCOMPRADOR').AsInteger := molProposta1.iComprador;
         qryDocs.ParamByName('PIDLOCATARIO').AsInteger := molProposta1.iComprador;
         qryDocs.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryReceitaIDTIPOCUSTORECIMO.AsInteger;
      end else begin
         qryDocs.ParamByName('PIDCOMPRADOR').AsInteger := molProposta1.iComprador;
         qryDocs.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := molProposta1.iProposta;
         qryDocs.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := qryReceitaIDTIPOCUSTORECIMO.AsInteger;
      end;
   end
   else
   begin
      MontaSqlDocCaR;
      LimpaParametros( qryDocs );
      qryDocs.ParamByName('PIDCOMPRADOR').AsInteger := molProposta1.iComprador;
      qryDocs.ParamByName('PIDLOCATARIO').AsInteger := molProposta1.iComprador;
   end;
   qryDocs.Open;

   sbtnAssociar.Enabled := qryParcCODDOCUMENTO.IsNull;
   sbtnCancelar.Enabled := not qryParcCODDOCUMENTO.IsNull;
end;

procedure TfrmExecAssociaDoc.sbAbrirClick(Sender: TObject);
begin
  inherited;
  AbreTabelas;
end;

procedure TfrmExecAssociaDoc.sbtnAssociarClick(Sender: TObject);
var sSql : String;
begin
  inherited;
  sSql := 'UPDATE PARCFINANCIMOV ' +#13+
          '   SET CODDOCUMENTO = ' + qryDocsCODDOCUMENTO.AsString + ', ' +
          '       FLGLANCINTEGRA = 7 ' +#13+
          ' WHERE IDPARCFINANCIMOV = ' + qryParcIDPARCFINANCIMOV.AsString;
  if not ExecutarQuery(DtmFinanciamento.qryAux, sSql) then begin
     MsgDlg('Não foi possível associar o documento','Erro',mtError,[mbOk],0);
  end else begin
     qryParc.Edit;
     qryParcCODDOCUMENTO.AsInteger := qryDocsCODDOCUMENTO.AsInteger;
     qryParc.Post;

     qryDocs.Delete;
  end;
end;


procedure TfrmExecAssociaDoc.sbtnCancelarClick(Sender: TObject);
var sSql :String;
begin
  inherited;
  sSql := 'UPDATE PARCFINANCIMOV ' +#13+
          '   SET CODDOCUMENTO       = NULL, ' +#13+
          '       FLGLANCINTEGRA     = NULL, ' +#13+
          '       DATAPAGAMENTO      = NULL, ' +#13+
          '       VLRPAGO            = NULL, ' +#13+
          '       VLRCORRIGIDOATRASO = NULL, ' +#13+
          '       VLRMULTAATRASO     = NULL, ' +#13+
          '       VLRMORAATRASO      = NULL  ' +#13+
          ' WHERE IDPARCFINANCIMOV =  ' + qryParcIDPARCFINANCIMOV.AsString;
  if not ExecutarQuery(DtmFinanciamento.qryAux, sSql) then begin
     MsgDlg('Não foi possível EXCLUIR a associação do documento','Erro',mtError,[mbOk],0);
  end else begin
     AbreTabelas;
  end;
end;

procedure TfrmExecAssociaDoc.DBgrdBemOriginalCellChanged(Sender: TObject);
begin
   inherited;
   sbtnAssociar.Enabled := qryParcCODDOCUMENTO.IsNull;
   sbtnCancelar.Enabled := not qryParcCODDOCUMENTO.IsNull;
end;

procedure TfrmExecAssociaDoc.MontaSqlDocAdminImob;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT CODDOCUMENTO, NODOCUMENTO, DATAVENCIMENTO, '                                                                      + #13 +
   '       SUM(VLRLANCRECEB) AS VLR_LANC '                                                                      + #13 +
   '  FROM LANCAMENTOSIMOVEL '                                                                                  + #13 +
   ' WHERE CODDOCUMENTO IS NOT NULL '                                                                           + #13 +
   '   AND IDTIPOCUSTORECIMO = :PIDTIPOCUSTORECIMO '                                                            + #13 +
   '   AND ( (:PIDLOCATARIO IS NULL) OR (IDFORCLI = :PIDLOCATARIO) ) '                                          + #13 +
   '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (IDIMOVEL IN (SELECT IDIMOVEL '                                    + #13 +
   '                                                         FROM CONTRATOXIMOVEL '                             + #13 +
   '                                                        WHERE IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)) ) '   + #13 +
   '   AND CODDOCUMENTO NOT IN ( SELECT P.CODDOCUMENTO '                                                        + #13 +
   '                               FROM CONTRATOIMOVEL C, PARCFINANCIMOV P, '                                   + #13 +
   '                                    ( SELECT DISTINCT IDCONDINICIAL, IDCONTRATOIMOVEL '                     + #13 +
   '                                        FROM CONDPAGIMOVEL ) CP '                                           + #13 +
   '                              WHERE C.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL '                              + #13 +
   '                                AND CP.IDCONDINICIAL = P.IDCONDPAGIMOVEL '                                  + #13 +
   '                                AND P.CODDOCUMENTO IS NOT NULL '                                            + #13 +
   '                                AND C.IDLOCATARIO = :PIDCOMPRADOR ) '                                       + #13 +
   ' GROUP BY CODDOCUMENTO, NODOCUMENTO, DATAVENCIMENTO '                                                                    + #13 +
   ' ORDER BY DATAVENCIMENTO '                                                                                  + #13;

   qryDocs.Sql.Text := sSQL;
end;

procedure TfrmExecAssociaDoc.MontaSqlDocCaR;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT D.CODDOCUMENTO, D.NODOCUMENTO, D.DATAVENCTO AS DATAVENCIMENTO, '                                                    + #13 +
   '       SUM(DECODE(DEBCRE,''D'',L.VALOR, L.VALOR*-1)) AS VLR_LANC '                                          + #13 +
   '  FROM DOCUMENTO D, LANCTODOCUM L '                                                                         + #13 +
   ' WHERE D.IDMODULO     = 4 '                                                                                 + #13 +
   ' AND   D.RECPAG       = ''R'' '                                                                             + #13 +
   ' AND   L.CODDOCUMENTO = D.CODDOCUMENTO '                                                                    + #13 +
   ' AND   L.OPERACAO IN (''2'',''4'') '                                                                        + #13 +
   ' AND ( (:PIDLOCATARIO IS NULL) OR (D.IDFORCLI = :PIDLOCATARIO) ) '                                          + #13 +
   ' AND D.CODDOCUMENTO NOT IN ( SELECT P.CODDOCUMENTO '                                                        + #13 +
   '                             FROM CONTRATOIMOVEL C, PARCFINANCIMOV P, '                                     + #13 +
   '                                  ( SELECT DISTINCT IDCONDINICIAL, IDCONTRATOIMOVEL '                       + #13 +
   '                                      FROM CONDPAGIMOVEL ) CP '                                             + #13 +
   '                             WHERE C.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL '                               + #13 +
   '                               AND CP.IDCONDINICIAL = P.IDCONDPAGIMOVEL '                                   + #13 +
   '                               AND P.CODDOCUMENTO IS NOT NULL '                                             + #13 +
   '                               AND C.IDLOCATARIO = :PIDCOMPRADOR ) '                                        + #13 +
   ' GROUP BY D.CODDOCUMENTO, D.NODOCUMENTO, D.DATAVENCTO '                                                                    + #13 +
   ' ORDER BY D.DATAVENCTO '                                                                                    + #13;

   qryDocs.Sql.Text := sSQL;
end;

procedure TfrmExecAssociaDoc.rgTipoAssociaClick(Sender: TObject);
begin
   inherited;
   dbcboReceita.Enabled := (rgTipoAssocia.ItemIndex = 0);
end;

end.


{  QRYPARC anterior
SELECT P.IDPARCFINANCIMOV, P.CODDOCUMENTO, P.NUMPARCELA, C.IDLOCATARIO,
       P.DATAVENCIMENTO, P.VLRPRESTACAO
  FROM CONTRATOIMOVEL C, PARCFINANCIMOV P,
       ( SELECT DISTINCT IDCONDINICIAL, IDCONTRATOIMOVEL
           FROM CONDPAGIMOVEL ) CP
 WHERE C.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL
   AND CP.IDCONDINICIAL = P.IDCONDPAGIMOVEL
   AND ( P.FLGTIPOLANC IN(2,3,5,6,7,8,10) OR (P.FLGTIPOLANC = 4 AND P.CODDOCUMENTO IS NOT NULL) )
   AND P.NUMPARCELA > 0
   AND C.IDLOCATARIO = :PIDCOMPRADOR
   AND ( (P.CODDOCUMENTO IS NULL AND NVL(P.FLGLANCINTEGRA,0) = 0 ) OR
         P.CODDOCUMENTO IN ( SELECT DISTINCT CODDOCUMENTO
                               FROM LANCAMENTOSIMOVEL
                              WHERE IDTIPOCUSTORECIMO = :PIDTIPOCUSTORECIMO
                                AND ( (:PIDLOCATARIO IS NULL) OR (IDFORCLI = :PIDLOCATARIO) )
                                AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (IDIMOVEL IN (SELECT IDIMOVEL
                                                                                      FROM CONTRATOXIMOVEL
                                                                                     WHERE IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)) )
                                ) )
 ORDER BY DATAVENCIMENTO

}



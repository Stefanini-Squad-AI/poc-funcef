//inicio andre tavares - pendência 20205 - 24/10/2005 -  utilizei a funcao round(M.VALORMOV, 2) As VALOR para fechar com a contabilidade.
unit FParamResFinAnual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  Spin, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamResFinAnual = class(TfrmOkCancelar)
    qryCCust: TwwQuery;
    Label3: TLabel;
    dblcCCust: TwwDBLookupCombo;
    SpAno: TSpinEdit;
    Label1: TLabel;
    edDataLimite: TCMDateTimePicker;
    Label2: TLabel;
    qryGrpProd: TwwQuery;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    RgOrdem: TRadioGroup;
    qry: TwwQuery;
    qryCODCENTROCUSTO: TStringField;
    qryNOME: TStringField;
    qryCODGRUPOPROD: TStringField;
    qryDESCGRUPOPROD: TStringField;
    qryMES: TStringField;
    qryCODARTIGO: TStringField;
    qryDESCRICAO: TStringField;
    qryDATAMOV: TDateTimeField;
    qryVALORMOV: TFloatField;
    qryQTDEMOV: TFloatField;
    qryCODMEDCUSTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SpAnoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure GerarQry;
    Procedure Processa;
  public
    { Public declarations }
  end;

var
  FrmParamResFinAnual: TFrmParamResFinAnual;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uModulo, DRptRelats, fAguarde;

procedure TFrmParamResFinAnual.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: Word;
begin
  inherited;
  qryGrpProd.Open;
  //
  qryCCust.Close;
  qryCCust.Params[0].Value :=  Sistema.IdEmpresa;
  qryCCust.Open;
  //
  DecodeDate( Date, Ano, Mes, Dia);
  spAno.Value       := Ano;
  edDataLimite.Date := Date;
end;

Procedure TFrmParamResFinAnual.GerarQry;
Begin
   DtmRptRelats.LbCentCust2.Caption := 'Todos';
   DtmRptRelats.LbGrpProd.Caption   := 'Todos';
   With qry Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                                  ');
         Sql.Add('     DECODE(M.CODCENTROCUSTO,NULL,''99999999999'',M.CODCENTROCUSTO) AS CODCENTROCUSTO,   ');
         Sql.Add('     DECODE(C.NOME,NULL,''CENTRO DE CUSTO NÃO CADASTRADO'',C.NOME) AS NOME,              ');
         Sql.Add('     G.CODGRUPOPROD,                                                                     ');
         Sql.Add('     G.DESCGRUPOPROD,                                                                    ');
         Sql.Add('     TO_CHAR(M.DATAMOV,''MM'') AS MES,                                                   ');
         Sql.Add('     M.CODARTIGO,                                                                        ');
         Sql.Add('    (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR)  AS DESCRICAO,            ');
         Sql.Add('     M.DATAMOV,                                                                          ');
         Sql.Add('     (round(M.VALORMOV, 2)*-1) AS VALORMOV,                                                        ');
         Sql.Add('     (M.QTDEMOV*-1)  AS QTDEMOV,                                                         ');
         Sql.Add('     P.CODMEDCUSTO                                                                       ');
         Sql.Add(' FROM                                                                                    ');
         Sql.Add('    MOVIMENT M,                                                                          ');
         Sql.Add('    ARTIGO A,                                                                            ');
         Sql.Add('    PRODUTO P,                                                                           ');
         Sql.Add('    CENTCUST C,                                                                          ');
         Sql.Add('    ALMOX A,                                                                             ');
         Sql.Add('    ALMOX T,                                                                             ');
         Sql.Add('    GRUPPROD G                                                                           ');
         Sql.Add(' WHERE                                                                                   ');
         Sql.Add('      (M.CODTIPOMOV <> ''A'')                                                            ');
         Sql.Add('  AND (M.CODTIPOMOV <> ''K'')                                                            ');
         Sql.Add('  AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)                                            ');
         Sql.Add('  AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))                                          ');
         Sql.Add('  AND ( (M.CODALMOXTRANSF IS NULL) OR                                                    ');
         Sql.Add('      ((M.CODALMOXTRANSF IS NOT NULL) AND ( A.CODCUSTEIO <> T.CODCUSTEIO)                ');
         Sql.Add('       AND ((T.CONTABIL <> ''T'') OR (T.CONTABIL IS NULL))))                             ');
         Sql.Add('  AND (TO_CHAR(M.DATAMOV,''YYYY'') = '+ IntToStr(SpAno.Value)+')                         ');
         Sql.Add('  AND (M.DATAMOV <= TO_DATE('''+DateToStr(edDataLimite.Date)+''',''DD/MM/YYYY''))        ');
   If Trim(dblcCCust.Text) <> '' Then
       Begin
         Sql.Add('  AND (RTRIM(M.CODCENTROCUSTO) = '''+Trim(dblcCCust.LookupValue)+''')' );
         DtmRptRelats.LbCentCust2.Caption := dblcCCust.Text;
       End;
   If Trim(dblcGrpProd.Text) <> '' Then
       Begin
         Sql.Add('  AND (RTRIM(P.CODGRUPOPROD) = '''+Trim(dblcGrpProd.LookupValue)+''')' );
         DtmRptRelats.LbGrpProd.Caption := dblcGrpProd.Text;
       End;
         Sql.Add('  AND (M.CODARTIGO = A.CODARTIGO)                                                        ');
         Sql.Add('  AND (A.CODPRODUTO = P.CODPRODUTO)                                                      ');
         Sql.Add('  AND (P.CODGRUPOPROD = G.CODGRUPOPROD)                                                  ');
         Sql.Add('  AND (M.CODCENTROCUSTO = C.CODCENTROCUSTO(+))                                           ');
         Sql.Add('  AND (M.IDEMPRESA = C.IDEMPRESA(+))                                                     ');
     Case RgOrdem.ItemIndex Of
        0 : Sql.Add('ORDER BY   DECODE(M.CODCENTROCUSTO,NULL,''99999999999'',M.CODCENTROCUSTO), '+
                    ' G.CODGRUPOPROD, M.CODARTIGO, M.DATAMOV, TO_CHAR(M.DATAMOV,''MM'')');

        1 : Sql.Add('ORDER BY   DECODE(M.CODCENTROCUSTO,NULL,''99999999999'',M.CODCENTROCUSTO), '+
                    ' G.CODGRUPOPROD, M.CODARTIGO, M.DATAMOV, TO_CHAR(M.DATAMOV,''MM'')');
     End;
      DtmRptRelats.LbTitulo.Caption := 'CUSTO POR CENTRO DE CUSTO DO ANO '+IntToStr(SpAno.Value);
      Open;
   End;
End;

Procedure TFrmParamResFinAnual.Processa;
Var
   Vet             : Array[1..13,1..2] of Double;
   x,J             : integer;
   sCodGrupoProd   : String;
   sDescProd       : string;
   sCodArt         : String;
   sDescricao      : String;
   sCodCentroCusto : String;
   sNome           : String;
   sUnid           : String; 
Begin
    For x := 1 To 13 Do
      Begin
          Vet[x,1] := 0;
          Vet[x,2] := 0;
      End;
    J              := 0;
    FrmAguarde.Min := 0;
    FrmAguarde.Max := qry.RecordCount;
    FrmAguarde.Pos := J;
    FrmAguarde.Mostra('Processando Informações');
    With DtmRptRelats.QryResFinAnual Do
       Begin
          If Active Then
            Begin
              If UpdatesPending Then
                 CancelUpdates;
              Close;
            End;
          Open;
       End;
    qry.First;
    sCodCentroCusto := qry.FieldByName('CODCENTROCUSTO').AsString;
    sNome           := qry.FieldByName('NOME').AsString;
    sCodGrupoProd   := qry.FieldByName('CODGRUPOPROD').AsString;
    sDescProd       := qry.FieldByName('DESCGRUPOPROD').AsString;
    sCodArt         := qry.FieldByName('CODARTIGO').AsString;
    sDescricao      := qry.FieldByName('DESCRICAO').AsString;
    sUnid           := qry.FieldByName('CODMEDCUSTO').AsString;
    While Not qry.Eof Do
       Begin
          If     (Trim(qry.FieldByName('CODCENTROCUSTO').AsString) <> Trim(sCodCentroCusto))
              Or (Trim(qry.FieldByName('CODGRUPOPROD').AsString) <> Trim(sCodGrupoProd))
              Or (Trim(qry.FieldByName('CODARTIGO').AsString) <> Trim(sCodArt))
          Then
            Begin
                // Faz o Calculo de Total de Meses
                For x:= 1 To 12 Do
                  Begin
                      Vet[13,1] := Vet[13,1] + Vet[x,1];
                      Vet[13,2] := Vet[13,2] + Vet[x,2];
                  End;
                With DtmRptRelats.qryResFinAnual Do
                   Begin
                        Append;
                        FieldByName('CODCENTROCUSTO').AsString := sCodCentroCusto;
                        FieldByName('NOME').AsString           := sNome;
                        FieldByName('CODGRUPOPROD').AsString   := sCodGrupoProd;
                        FieldByName('DESCGRUPOPROD').AsString  := sDescProd;
                        FieldByName('CODARTIGO').AsString      := sCodArt;
                        FieldByName('DESCRICAO').AsString      := sDescricao;
                        FieldByName('UNID').AsString           := sUnid;
                        // TOTAL DE VALORES DOS MESES
                        FieldByName('VALJAN').AsFloat := vet[1,1];
                        FieldByName('VALFEV').AsFloat := vet[2,1];
                        FieldByName('VALMAR').AsFloat := vet[3,1];
                        FieldByName('VALABR').AsFloat := vet[4,1];
                        FieldByName('VALMAI').AsFloat := vet[5,1];
                        FieldByName('VALJUN').AsFloat := vet[6,1];
                        FieldByName('VALJUL').AsFloat := vet[7,1];
                        FieldByName('VALAGO').AsFloat := vet[8,1];
                        FieldByName('VALSEB').AsFloat := vet[9,1];
                        FieldByName('VALOUT').AsFloat := vet[10,1];
                        FieldByName('VALNOV').AsFloat := vet[11,1];
                        FieldByName('VALDEZ').AsFloat := vet[12,1];
                        FieldByName('VALTOT').AsFloat := vet[13,1];
                        // TOTAL DE QUANTIDADE DOS MESES
                        FieldByName('QTDEJAN').AsFloat := vet[1,2];
                        FieldByName('QTDEFEV').AsFloat := vet[2,2];
                        FieldByName('QTDEMAR').AsFloat := vet[3,2];
                        FieldByName('QTDEABR').AsFloat := vet[4,2];
                        FieldByName('QTDEMAI').AsFloat := vet[5,2];
                        FieldByName('QTDEJUN').AsFloat := vet[6,2];
                        FieldByName('QTDEJUL').AsFloat := vet[7,2];
                        FieldByName('QTDEAGO').AsFloat := vet[8,2];
                        FieldByName('QTDESEB').AsFloat := vet[9,2];
                        FieldByName('QTDEOUT').AsFloat := vet[10,2];
                        FieldByName('QTDENOV').AsFloat := vet[11,2];
                        FieldByName('QTDEDEZ').AsFloat := vet[12,2];
                        FieldByName('QTDETOT').AsFloat := vet[13,2];
                        Post;
                        // Troca as variaveis de Flag do Lote Encaixantes
                        sCodCentroCusto := qry.FieldByName('CODCENTROCUSTO').AsString;
                        sNome           := qry.FieldByName('NOME').AsString;
                        sCodGrupoProd   := qry.FieldByName('CODGRUPOPROD').AsString;
                        sDescProd       := qry.FieldByName('DESCGRUPOPROD').AsString;
                        sCodArt         := qry.FieldByName('CODARTIGO').AsString;
                        sDescricao      := qry.FieldByName('DESCRICAO').AsString;
                        sUnid           := qry.FieldByName('CODMEDCUSTO').AsString;
                        // Limpa o Vetor
                        For x := 1 To 13 Do
                          Begin
                              Vet[x,1] := 0;
                              Vet[x,2] := 0;
                          End;
                       qry.Prior;
                   End;
            End
            Else
               Begin
                  Vet[qry.FieldByName('MES').asInteger,1] := Vet[qry.FieldByName('MES').asInteger,1] + qry.FieldByName('VALORMOV').asFloat;
                  Vet[qry.FieldByName('MES').asInteger,2] := Vet[qry.FieldByName('MES').asInteger,2] + qry.FieldByName('QTDEMOV').asFloat;
               End;
            Inc( J );
            FrmAguarde.Pos := J;
            qry.Next;
       End;

       // Faz o Calculo de Total de Meses
       For x:= 1 To 12 Do
         Begin
             Vet[13,1] := Vet[13,1] + Vet[x,1];
             Vet[13,2] := Vet[13,2] + Vet[x,2];
         End;

       With DtmRptRelats.qryResFinAnual Do
          Begin
              Append;
              FieldByName('CODCENTROCUSTO').AsString := qry.FieldByName('CODCENTROCUSTO').AsString;
              FieldByName('NOME').AsString           := qry.FieldByName('NOME').AsString;
              FieldByName('CODGRUPOPROD').AsString   := qry.FieldByName('CODGRUPOPROD').AsString;
              FieldByName('DESCGRUPOPROD').AsString  := qry.FieldByName('DESCGRUPOPROD').AsString;
              FieldByName('CODARTIGO').AsString      := qry.FieldByName('CODARTIGO').AsString;
              FieldByName('DESCRICAO').AsString      := qry.FieldByName('DESCRICAO').AsString;
              FieldByName('UNID').AsString           := qry.FieldByName('CODMEDCUSTO').AsString;
              // TOTAL DE VALORES DOS MESES
              FieldByName('VALJAN').AsFloat := vet[1,1];
              FieldByName('VALFEV').AsFloat := vet[2,1];
              FieldByName('VALMAR').AsFloat := vet[3,1];
              FieldByName('VALABR').AsFloat := vet[4,1];
              FieldByName('VALMAI').AsFloat := vet[5,1];
              FieldByName('VALJUN').AsFloat := vet[6,1];
              FieldByName('VALJUL').AsFloat := vet[7,1];
              FieldByName('VALAGO').AsFloat := vet[8,1];
              FieldByName('VALSEB').AsFloat := vet[9,1];
              FieldByName('VALOUT').AsFloat := vet[10,1];
              FieldByName('VALNOV').AsFloat := vet[11,1];
              FieldByName('VALDEZ').AsFloat := vet[12,1];
              FieldByName('VALTOT').AsFloat := vet[13,1];
              // TOTAL DE QUANTIDADE DOS MESES
              FieldByName('QTDEJAN').AsFloat := vet[1,2];
              FieldByName('QTDEFEV').AsFloat := vet[2,2];
              FieldByName('QTDEMAR').AsFloat := vet[3,2];
              FieldByName('QTDEABR').AsFloat := vet[4,2];
              FieldByName('QTDEMAI').AsFloat := vet[5,2];
              FieldByName('QTDEJUN').AsFloat := vet[6,2];
              FieldByName('QTDEJUL').AsFloat := vet[7,2];
              FieldByName('QTDEAGO').AsFloat := vet[8,2];
              FieldByName('QTDESEB').AsFloat := vet[9,2];
              FieldByName('QTDEOUT').AsFloat := vet[10,2];
              FieldByName('QTDENOV').AsFloat := vet[11,2];
              FieldByName('QTDEDEZ').AsFloat := vet[12,2];
              FieldByName('QTDETOT').AsFloat := vet[13,2];
              Post;
          End;
      FrmAguarde.Apaga;

End;

procedure TFrmParamResFinAnual.SpAnoChange(Sender: TObject);
begin
  inherited;
  edDataLimite.Date := StrToDate('31/12/'+IntToStr(SpAno.Value));
end;

procedure TFrmParamResFinAnual.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  GerarQry;
  If qry.IsEmpty Then
    Begin
       MsgDlg('Não há dados para processar neste relatório','Informação',mtInformation,[mbOK],0);
       ModalResult :=  mrNone;
    End
  Else
    Begin
        Processa;
        ModalResult :=  mrOk;
    End;
end;

end.

unit FParamReqCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  TEdNum, CMDBLookupCombo, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamReqCad = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    RgOrdem: TRadioGroup;
    qryAlmox: TwwQuery;
    dblkcmbAlmox: TwwDBLookupCombo;
    dblcCCust: TwwDBLookupCombo;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    qryCCust: TwwQuery;
    qryReq: TwwQuery;
    DblcNumReq: TCMDBLookupCombo;
    RgStatus: TRadioGroup;
    RgImp: TRadioGroup;
    qryGrpProd: TwwQuery;
    Label3: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DblcNumReqExit(Sender: TObject);
    procedure RgImpClick(Sender: TObject);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamReqCad: TFrmParamReqCad;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, DRptRelats;

procedure TFrmParamReqCad.FormCreate(Sender: TObject);
begin
  inherited;
  qryCCust.Close;
  qryCCust.Params[0].Value := Sistema.IdEmpresa;
  qryCCust.Open;
  //
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  qryReq.Close;
  qryReq.ParamByName('IMPRESSO').AsString := 'F';
  qryReq.Open;
  //
  qryGrpProd.Close;
  qryGrpProd.Params[0].asInteger := Sistema.IdEmpresa;
  qryGrpProd.Open;
  //
  deDataInicial.Date := Date;
  deDataFinal.Date   := Date;
end;

Procedure TFrmParamReqCad.FazQry;
Begin
  DtmRptRelats.lbCCust.Caption   := 'Todos';
  DtmRptRelats.lbPer15.Caption   := '';
  With DtmRptRelats.qryReqCad Do
    Begin
         Close;
         Sql.Clear;
         Sql.Add(' SELECT                                                                         ');
         Sql.Add('      RQ.NUMREQUISICAO,                                                         ');
         Sql.Add('      DECODE(RQ.CUSTOTRANSF,''T'',AD.DESCALMOX,CC.NOME) AS DESTINO,             ');
         Sql.Add('      RQ.DATAEMISSAO,                                                           ');
         Sql.Add('      RQ.DATANECESSIDADE,                                                       ');
         Sql.Add('      DECODE(RQ.REQATENDIDA,''F'',''PENDENTE'', DECODE(RQ.REQATENDIDA,''T'',''ATEND. TOTAL'',''ATEND. PARCIAL'') )  AS  STATUS, ');         
         Sql.Add('      AO.DESCALMOX AS ORIGEM,                                                   ');
         Sql.Add('      SL.LOCALIZACAO, ');
         Sql.Add('      IP.CODARTIGO,                                                             ');
         Sql.Add('      (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) AS DESCRICAO,  ');
         Sql.Add('      IP.CODMEDIDA,                                 ');
         Sql.Add('      IP.QTDEPEDIDA,                                ');
         Sql.Add('      IP.QTDEPENDENTE,                              ');
         Sql.Add('      (IP.VALORUN ) AS VALORUN,                     ');
         Sql.Add('      (IP.VALORUN * IP.QTDEPEDIDA)  AS VALOR,       ');
         Sql.Add('      PE.RAZAOSOCIAL,               ');
         Sql.Add('      RQ.TRGDTINCLUSAO,             ');
         Sql.Add('      RQ.OBS,                       ');
         Sql.Add('      IP.OBS AS OBSITEM,            ');
         Sql.Add('      U.NOME AS UNIDNEGOC           ');
         Sql.Add(' FROM                               ');
         Sql.Add('     PESSOA PE,                     ');
         Sql.Add('     ITEMPEDI IP,                   ');
         Sql.Add('     REQMAT RQ,                     ');
         Sql.Add('     SALDO SL,                      ');
         Sql.Add('     ARTIGO A,                      ');
         Sql.Add('     PRODUTO P,                     ');
         Sql.Add('     CENTCUST CC,                   ');
         Sql.Add('     ALMOX AD,                      ');
         Sql.Add('     ALMOX AO,                      ');
         Sql.Add('     UNIDNEGOCIO U                  ');
         Sql.Add(' WHERE (RQ.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ');
      Case RgStatus.ItemIndex Of
         1 : Sql.Add(' AND (RQ.REQATENDIDA =''F'' )');
         2 : Sql.Add(' AND (RQ.REQATENDIDA =''T'' )');
         3 : Sql.Add(' AND (RQ.REQATENDIDA =''P'' )');
      End;
//===== Filtros =================================================================================================================================
      If Trim(DblcNumReq.Text) <> '' Then
         Sql.Add(' AND (RQ.NUMREQUISICAO = '+DblcNumReq.LookupValue+') ')
      Else
         Begin
           If (Trim(deDataInicial.Text) <> '' )  Then
              Begin
                 Sql.Add(' AND (RQ.DATAEMISSAO >= TO_DATE('''+DateToStr(deDataInicial.Date)+''',''DD/MM/YYYY'')) ');
                 DtmRptRelats.lbPer15.Caption   := 'A partir de '+deDataInicial.Text;
              End;
           If (Trim(deDataFinal.Text) <> '') Then
              Begin
                 Sql.Add(' AND (RQ.DATAEMISSAO <= TO_DATE('''+DateToStr(deDataFinal.Date)+''',''DD/MM/YYYY'')) ');
                 DtmRptRelats.lbPer15.Caption   := 'Até  '+deDataFinal.Text;
              End;
           If Trim(dblcCCust.Text) <> '' Then
              Begin
                Sql.Add(' AND (RTRIM(RQ.CODCENTROCUSTO) = '+Trim(dblcCCust.LookupValue)+')           ');
                DtmRptRelats.lbCCust.Caption := dblcCCust.Text;
              End;
           If Trim(dblcGrpProd.Text) <> ''  Then
              sql.Add(' AND (RTRIM(P.CODGRUPOPROD) = '+QuotedStr(Trim(dblcGrpProd.LookUpValue))+' ) ');

     //================================================================================================================================================
           If (Trim(dblkcmbAlmox.Text) <> '') Then
              Sql.Add(' AND (RQ.CODALMOXAORIGEM = '+dblkcmbAlmox.LookupValue+') ');
         End;
         Sql.Add('    AND (RQ.CODALMOXADESTINO  = AD.CODALMOXARIFADO(+)) ');
         Sql.Add('    AND (RQ.CODALMOXAORIGEM   = AO.CODALMOXARIFADO)    ');
         Sql.Add('    AND (RQ.CODCENTROCUSTO    = CC.CODCENTROCUSTO)     ');
         Sql.Add('    AND (RQ.IDEMPRESA         = CC.IDEMPRESA)          ');
         Sql.Add('    AND (RQ.IDUSUARIOINCLUSAO = PE.IDPESSOA)           ');
         Sql.Add('    AND (RQ.UNIDNEGOC         = U.UNIDNEGOC(+) )       ');
         Sql.Add('    AND (RQ.IDPESSOA          = U.IDPESSOA(+) )        ');
         Sql.Add('    AND (IP.NUMREQUISICAO     = RQ.NUMREQUISICAO)      ');
         Sql.Add('    AND (P.CODPRODUTO         = A.CODPRODUTO )         ');
         Sql.Add('    AND (A.CODARTIGO          = IP.CODARTIGO )         ');
         Sql.Add('    AND (A.CODARTIGO(+)       = SL.CODARTIGO )         ');
         Sql.Add('    AND (AO.CODALMOXARIFADO(+)= SL.CODALMOXARIFADO )   ');

         Case RgOrdem.ItemIndex Of
            0 : Sql.Add(' ORDER BY ORIGEM, RQ.NUMREQUISICAO,(P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR) ');
            1 : Sql.Add(' ORDER BY ORIGEM, RQ.NUMREQUISICAO ');
         End;
      If (Trim(deDataInicial.Text) <> '' ) And (Trim(deDataFinal.Text) <> '') Then
         DtmRptRelats.lbPer15.Caption := 'De '+deDataInicial.Text+' a '+deDataFinal.Text+' ';
        Open;
    End;
End;

procedure TFrmParamReqCad.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
  Fazqry;
end;

procedure TFrmParamReqCad.DblcNumReqExit(Sender: TObject);
begin
  inherited;
  If Trim(DblcNumReq.Text) <> '' Then
    Begin
        dblkcmbAlmox.Text  := '';
        dblcCCust.Text     := '';
        deDataInicial.Text := '';
        deDataFinal.Text   := '';
    End;
end;

procedure TFrmParamReqCad.RgImpClick(Sender: TObject);
Var
   s : String;
begin
  inherited;
  Case RgImp.ItemIndex Of
     0 : s := 'T';
     1 : s := 'F';
  End;
  qryReq.Close;
  qryReq.ParamByName('IMPRESSO').AsString := S;
  qryReq.Open;
end;

end.

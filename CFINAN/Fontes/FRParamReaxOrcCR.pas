unit FRParamReaxOrcCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Grids, IvDictio, IvMulti, IvEMulti,
  Mask, wwdbedit, Wwdbspin, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRParamReaxOrcCR = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    rgrpTipo: TRadioGroup;
    rgPrazoOrc: TRadioGroup;
    Label4: TLabel;
    dblkcmbAtividade: TwwDBLookupCombo;
    Label5: TLabel;
    dblkcmbCentro: TwwDBLookupCombo;
    gbGrauMaximo: TGroupBox;
    seGrauMaxCAP: TwwDBSpinEdit;
    seGrauMaxCAR: TwwDBSpinEdit;
    cbContasZero: TCheckBox;
    lblCAR: TLabel;
    lblCAP: TLabel;
    qryAtiv: TwwQuery;
    qryCentro: TwwQuery;
    cbImprimeCentavos: TCheckBox;
    qryPrepOrcRea: TwwQuery;
    Label6: TLabel;
    dblcCentroCusto: TwwDBLookupCombo;
    qryCC: TwwQuery;
    cbAnalitico: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure seGrauMaxCARChange(Sender: TObject);
    procedure seGrauMaxCAPChange(Sender: TObject);
    function BuscaValorRea(sRecPag,sCodTipRecDes,sCodCentroRespon:String):Double;
    function BuscaValorOrc(sRecPag,sCodTipRecDes,sCodCentroRespon:String):Double;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamReaxOrcCR: TfrmRParamReaxOrcCR;
  sMascaraCAP,sMascaraCAR,sAux     :String;
  iAux,iNumMaxEleCAR,iNumMaxEleCAP :Integer;

implementation

uses DRelatoriosCFinan, uSistema, uIntegraBack, uFuncaoGeral;

{$R *.DFM}

procedure TfrmRParamReaxOrcCR.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
  //
  qryAtiv.Close;
  qryAtiv.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryAtiv.Open;
  //
  qryCentro.Close;
  qryCentro.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCentro.Open;
  //
  qryCC.Close;
  qryCC.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCC.Open;
  //
  sMascaraCAR:=IntegraBack.MascaraReceb;
  seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
  seGrauMaxCAR.Value   :=seGrauMaxCAR.MaxValue;
  sAux:=FloatToStr(seGrauMaxCAR.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,iAux);
  //
  sMascaraCAP:=IntegraBack.MascaraDesemb;
  seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);
  seGrauMaxCAP.Value   :=seGrauMaxCAP.MaxValue;
  sAux:=FloatToStr(seGrauMaxCAP.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,iAux);
  //
end;

procedure TfrmRParamReaxOrcCR.bbtnConfirmarClick(Sender: TObject);
var iTeste,iGrau,iGrauCAR,iGrauCAP : Integer;
    fSinal : Double;
begin
   inherited;
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,1);
   With dtmRelatoriosCFinan do begin
      qryOrcxReaCR.Close;
      qryOrcxReaCR.SQL.Clear;
      qryOrcxReaCR.SQL.Add('SELECT ');
      qryOrcxReaCR.SQL.Add('  C.CODCENTRORESPON, C.NOME,  ');
      qryOrcxReaCR.SQL.Add('  DECODE(T.FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'',''1. Recebimentos - Pagamentos'') AS GR, ');
      qryOrcxReaCR.SQL.Add('  DECODE(T.FLGINDICARECDES,''N'',DECODE(T.RECPAG, ''R'', ''2.1. Outras Entradas'', ''2.2. Outras Saídas''),DECODE(T.RECPAG, ''R'', ''1.1. Recebimentos'', ''1.2. Pagamentos'')) AS RP, ');
      qryOrcxReaCR.SQL.Add('  T.ANASINT, T.RECPAG, T.CODTIPRECDES, T.DESCRICAO, 0 AS VALORREA, 0 AS VALORORC,         ');
      qryOrcxReaCR.SQL.Add('  0 AS DIFERENCA,0 AS PERC, 0 AS VALORREASIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,');
      qryOrcxReaCR.SQL.Add('  0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA ');
      qryOrcxReaCR.SQL.Add('FROM                                                  ');
      qryOrcxReaCR.SQL.Add('  TIPORECEBDESEMB T, CENTRESPON C                     ');
      qryOrcxReaCR.SQL.Add('WHERE                                                 ');
      qryOrcxReaCR.SQL.Add('       (T.IDPESSOA     = :IDPESSOA)                   ');
      qryOrcxReaCR.SQL.Add('   AND (C.IDPESSOA     = :IDPESSOA)                   ');
      If cbAnalitico.Checked then
         qryOrcxReaCR.SQL.Add('   AND (C.ANALITICOSINTET = ''A'')                    ');
      If trim(dblkcmbCentro.Text) <> '' then
         qryOrcxReaCR.SQL.Add('   AND (RTRIM(C.CODCENTRORESPON) = :CODCENTRORESPON )  ');
      qryOrcxReaCR.SQL.Add('ORDER BY C.CODCENTRORESPON, GR, RP, T.CODTIPRECDES    ');

      qryOrcxReaCR.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      If trim(dblkcmbCentro.Text) <> '' then
         qryOrcxReaCR.ParamByName('CODCENTRORESPON').AsString := Trim(dblkcmbCentro.LookupValue);
      qryOrcxReaCR.Open;

      qryOrcxReaCR.First;
      While not qryOrcxReaCR.EOF do
      begin

         if qryOrcxReaCR.FieldByName('RECPAG').AsString = 'R' then
          begin
             iTeste:=iNumMaxEleCAR;
             fSinal:=1;
             iGrau :=iGrauCAR;
          end
         else
          begin
             iTeste:=iNumMaxEleCAP;
             fSinal:=-1;
             iGrau :=iGrauCAP;
          end;

         if length(trim(qryOrcxReaCR.FieldByName('CODTIPRECDES').AsString)) > iTeste then
            qryOrcxReaCR.Delete
         else
          begin
             qryOrcxReaCR.Edit;
             qryOrcxReaCR.FieldByName('VALORREA').AsFloat:=
                          BuscaValorRea(qryOrcxReaCR.FieldByName('RECPAG').AsString,
                          qryOrcxReaCR.FieldByName('CODTIPRECDES').AsString,
                          qryOrcxReaCR.FieldByName('CODCENTRORESPON').AsString);

             qryOrcxReaCR.FieldByName('VALORORC').AsFloat:=
                          BuscaValorOrc(qryOrcxReaCR.FieldByName('RECPAG').AsString,
                          qryOrcxReaCR.FieldByName('CODTIPRECDES').AsString,
                          qryOrcxReaCR.FieldByName('CODCENTRORESPON').AsString);

             qryOrcxReaCR.FieldByName('DIFERENCA').AsFloat:=
                          qryOrcxReaCR.FieldByName('VALORORC').AsFloat -
                          qryOrcxReaCR.FieldByName('VALORREA').AsFloat;

             if qryOrcxReaCR.FieldByName('VALORORC').AsFloat <> 0 then
                qryOrcxReaCR.FieldByName('PERC').AsFloat     :=
                             (((qryOrcxReaCR.FieldByName('VALORORC').AsFloat -
                                qryOrcxReaCR.FieldByName('VALORREA').AsFloat)/
                                qryOrcxReaCR.FieldByName('VALORORC').AsFloat)*100);

             if length(trim(qryOrcxReaCR.FieldByName('CODTIPRECDES').AsString)) = iGrau then
              begin
                 qryOrcxReaCR.FieldByName('VALORREASIN').AsFloat :=
                              qryOrcxReaCR.FieldByName('VALORREA').AsFloat*fSinal;
                 qryOrcxReaCR.FieldByName('VALORORCSIN').AsFloat :=
                              qryOrcxReaCR.FieldByName('VALORORC').AsFloat*fSinal;
                 qryOrcxReaCR.FieldByName('DIFERENCASIN').AsFloat:=
                              qryOrcxReaCR.FieldByName('VALORORCSIN').AsFloat -
                              qryOrcxReaCR.FieldByName('VALORREASIN').AsFloat;
                 qryOrcxReaCR.FieldByName('VALORREAANA').AsFloat :=
                              qryOrcxReaCR.FieldByName('VALORREA').AsFloat;
                 qryOrcxReaCR.FieldByName('VALORORCANA').AsFloat :=
                              qryOrcxReaCR.FieldByName('VALORORC').AsFloat;
                 qryOrcxReaCR.FieldByName('DIFERENCAANA').AsFloat:=
                              qryOrcxReaCR.FieldByName('DIFERENCA').AsFloat;
              end;
             qryOrcxReaCR.Post;

            if not cbContasZero.Checked and ((qryOrcxReaCR.FieldByName('VALORREA').AsFloat = 0) and
                                             (qryOrcxReaCR.FieldByName('VALORORC').AsFloat = 0)) then
               qryOrcxReaCR.Delete
            else
               qryOrcxReaCR.Next;

          end;
      end;

      if trim(dblkcmbCentro.Text) <> '' then
         ppLabel25.Caption := 'ORÇADO x REALIZADO POR CR DE '+
                              deDataInicial.Text+' À '+deDataFinal.Text + ' - '+
                              Trim(dblkcmbCentro.Text)
      else if trim(dblcCentroCusto.Text) <> '' then
         ppLabel25.Caption := 'ORÇADO x REALIZADO POR CC DE '+
                              deDataInicial.Text+' À '+deDataFinal.Text + ' - '+
                              Trim(dblcCentroCusto.Text)
      else
         ppLabel25.Caption := 'ORÇADO x REALIZADO DE '+
                              deDataInicial.Text+' À '+deDataFinal.Text;


      if cbImprimeCentavos.Checked then
       begin
          rpOrcxReaCRDBText3.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBText4.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBText5.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaCRDBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc3.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaCRDBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc6.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaCRDBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaCRDBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
      end
     else
      begin
         rpOrcxReaCRDBText3.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBText4.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBText5.DisplayFormat := '#,0;(#,0)';
         //
         rpOrcxReaCRDBCalc1.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc2.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc3.DisplayFormat := '#,0;(#,0)';
         //
         rpOrcxReaCRDBCalc4.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc5.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc6.DisplayFormat := '#,0;(#,0)';
         //
         rpOrcxReaCRDBCalc7.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc8.DisplayFormat := '#,0;(#,0)';
         rpOrcxReaCRDBCalc9.DisplayFormat := '#,0;(#,0)';
      end;
   end;
end;

procedure TfrmRParamReaxOrcCR.seGrauMaxCARChange(Sender: TObject);
begin
  inherited;
  sAux:=FloatToStr(seGrauMaxCAR.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,iAux);
end;

procedure TfrmRParamReaxOrcCR.seGrauMaxCAPChange(Sender: TObject);
begin
  inherited;
  sAux:=FloatToStr(seGrauMaxCAP.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,iAux);
end;

function TfrmRParamReaxOrcCR.BuscaValorRea(sRecPag,sCodTipRecDes,sCodCentroRespon:String):Double;
begin
   Result:=0;
   qryPrepOrcRea.Close;
   qryPrepOrcRea.SQL.Clear;
   qryPrepOrcRea.SQL.Add('SELECT ');
   qryPrepOrcRea.SQL.Add('  SUM(DECODE(FR.VALOR,NULL,0,FR.VALOR)) AS VALORREA ');
   qryPrepOrcRea.SQL.Add('FROM                                                       ');
   qryPrepOrcRea.SQL.Add('  FLUXOREAL FR                                             ');
   qryPrepOrcRea.SQL.Add('WHERE                                                      ');
   qryPrepOrcRea.SQL.Add('       (FR.IDPESSOA     = :IDPESSOA)                       ');
   qryPrepOrcRea.SQL.Add('   AND (FR.DATACFLOAT >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (FR.DATACFLOAT <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (RTRIM(FR.CODTIPRECDES) LIKE :CODTIPRECDES)         ');
   qryPrepOrcRea.SQL.Add('   AND (FR.RECPAG = :RECPAG)                               ');
   qryPrepOrcRea.SQL.Add('   AND (RTRIM(FR.CODCENTRORESPON) LIKE :CODCENTRORESPON )  ');
   if trim(dblcCentroCusto.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (RTRIM(FR.CODCENTROCUSTO) LIKE :CODCENTROCUSTO )    ');
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (FR.UNIDNEGOC = :UNIDNEGOC)                      ');
   //
   qryPrepOrcRea.ParamByName('IDPESSOA').AsInteger    :=Sistema.IdEmpresa;
   qryPrepOrcRea.ParamByName('DATAINI').AsString      :=deDataInicial.Text;
   qryPrepOrcRea.ParamByName('DATAFIM').AsString      :=deDataFinal.Text;
   qryPrepOrcRea.ParamByName('CODTIPRECDES').AsString :=trim(sCodTipRecDes)+'%';
   qryPrepOrcRea.ParamByName('RECPAG').AsString       :=sRecPag;
   qryPrepOrcRea.ParamByName('CODCENTRORESPON').AsString := Trim(sCodCentroRespon)+'%';
   if trim(dblcCentroCusto.Text) <> '' then
     qryPrepOrcRea.ParamByName('CODCENTROCUSTO').AsString := Trim(dblcCentroCusto.LookupValue)+'%';
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.ParamByName('UNIDNEGOC').AsInteger := StrToInt(dblkcmbAtividade.LookupValue);
   qryPrepOrcRea.Open;
   if not qryPrepOrcRea.isEmpty then Result := qryPrepOrcRea.FieldByName('VALORREA').AsFloat;

end;

function TfrmRParamReaxOrcCR.BuscaValorOrc(sRecPag,sCodTipRecDes,sCodCentroRespon:String):Double;
begin
   Result:=0;
   qryPrepOrcRea.Close;
   qryPrepOrcRea.SQL.Clear;
   qryPrepOrcRea.SQL.Add('SELECT ');
   qryPrepOrcRea.SQL.Add('  SUM(DECODE(FO.VALOR,NULL,0,FO.VALOR)) AS VALORORC ');
   qryPrepOrcRea.SQL.Add('FROM                                                       ');
   qryPrepOrcRea.SQL.Add('  FLUXOORCADO FO                                           ');
   qryPrepOrcRea.SQL.Add('WHERE                                                      ');
   qryPrepOrcRea.SQL.Add('       (FO.IDPESSOA     = :IDPESSOA)                       ');
   qryPrepOrcRea.SQL.Add('   AND (FO.DATAPROGRAMADA >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (FO.DATAPROGRAMADA <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (RTRIM(FO.CODTIPRECDES) LIKE :CODTIPRECDES)         ');
   qryPrepOrcRea.SQL.Add('   AND (FO.RECPAG = :RECPAG)                               ');
   qryPrepOrcRea.SQL.Add('   AND (FO.PRAZO  = :PRAZO)                                ');
   qryPrepOrcRea.SQL.Add('   AND (RTRIM(FO.CODCENTRORESPON) LIKE :CODCENTRORESPON )  ');
   if trim(dblcCentroCusto.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (RTRIM(FO.CODCENTROCUSTO) LIKE :CODCENTROCUSTO )    ');
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (FO.UNIDNEGOC = :UNIDNEGOC)                      ');
   //
   qryPrepOrcRea.ParamByName('IDPESSOA').AsInteger    :=Sistema.IdEmpresa;
   qryPrepOrcRea.ParamByName('DATAINI').AsString      :=deDataInicial.Text;
   qryPrepOrcRea.ParamByName('DATAFIM').AsString      :=deDataFinal.Text;
   qryPrepOrcRea.ParamByName('CODTIPRECDES').AsString :=trim(sCodTipRecDes)+'%';
   qryPrepOrcRea.ParamByName('RECPAG').AsString       :=sRecPag;
   qryPrepOrcRea.ParamByName('CODCENTRORESPON').AsString := Trim(sCodCentroRespon)+'%';
   if trim(dblcCentroCusto.Text) <> '' then
     qryPrepOrcRea.ParamByName('CODCENTROCUSTO').AsString := Trim(dblcCentroCusto.LookupValue)+'%';
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.ParamByName('UNIDNEGOC').AsInteger := StrToInt(dblkcmbAtividade.LookupValue);
   case rgPrazoOrc.ItemIndex of
     0 : qryPrepOrcRea.ParamByName('PRAZO').AsString :='C';
     1 : qryPrepOrcRea.ParamByName('PRAZO').AsString :='M';
     2 : qryPrepOrcRea.ParamByName('PRAZO').AsString :='L';
   end;
   qryPrepOrcRea.Open;
   if not qryPrepOrcRea.isEmpty then Result := qryPrepOrcRea.FieldByName('VALORORC').AsFloat;
end;

end.


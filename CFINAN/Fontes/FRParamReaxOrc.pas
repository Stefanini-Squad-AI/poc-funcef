unit FRParamReaxOrc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, Grids, IvDictio, IvMulti, IvEMulti,
  Mask, wwdbedit, Wwdbspin, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRParamReaxOrc = class(TfrmOkCancelar)
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
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure seGrauMaxCARChange(Sender: TObject);
    procedure seGrauMaxCAPChange(Sender: TObject);
    function BuscaValorRea(sRecPag,sCodTipRecDes:String):Double;
    function BuscaValorOrc(sRecPag,sCodTipRecDes:String):Double;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRParamReaxOrc: TfrmRParamReaxOrc;
  sMascaraCAP,sMascaraCAR,sAux     :String;
  iAux,iNumMaxEleCAR,iNumMaxEleCAP :Integer;

implementation

{$R *.DFM}

uses DRelatoriosCFinan, uSistema, uIntegraBack, uFuncaoGeral;

procedure TfrmRParamReaxOrc.FormActivate(Sender: TObject);
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

procedure TfrmRParamReaxOrc.bbtnConfirmarClick(Sender: TObject);
var iTeste,iGrau,iGrauCAR,iGrauCAP : Integer;
    fSinal : Double;
begin
   inherited;
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,1);
   With dtmRelatoriosCFinan do
   begin
      qryOrcxRea.Close;
      qryOrcxRea.SQL.Clear;
      qryOrcxRea.SQL.Add('SELECT ');
      qryOrcxRea.SQL.Add('  DECODE(FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'',''1. Recebimentos - Pagamentos'') AS GR, ');
      qryOrcxRea.SQL.Add('  DECODE(FLGINDICARECDES,''N'',DECODE(RECPAG, ''R'', ''2.1. Outras Entradas'', ''2.2. Outras Saídas''),DECODE(RECPAG, ''R'', ''1.1. Recebimentos'', ''1.2. Pagamentos'')) AS RP, ');
      qryOrcxRea.SQL.Add('  ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, 0 AS VALORREA, 0 AS VALORORC,         ');
      qryOrcxRea.SQL.Add('  0 AS DIFERENCA,0 AS PERC, 0 AS VALORREASIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,');
      qryOrcxRea.SQL.Add('  0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA ');
      qryOrcxRea.SQL.Add('FROM                                                       ');
      qryOrcxRea.SQL.Add('  TIPORECEBDESEMB                                          ');
      qryOrcxRea.SQL.Add('WHERE                                                      ');
      qryOrcxRea.SQL.Add('       (IDPESSOA     = :IDPESSOA)                          ');
      qryOrcxRea.SQL.Add('ORDER BY GR, RP, CODTIPRECDES                         ');
      qryOrcxRea.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryOrcxRea.Open;
      qryOrcxRea.First;

      While not qryOrcxRea.EOF do begin
         if qryOrcxRea.FieldByName('RECPAG').AsString = 'R' then begin
            iTeste:=iNumMaxEleCAR;
            fSinal:=1;
            iGrau :=iGrauCAR;
         end else begin
            iTeste:=iNumMaxEleCAP;
            fSinal:=-1;
            iGrau :=iGrauCAP;
         end;

         if length(trim(qryOrcxRea.FieldByName('CODTIPRECDES').AsString)) > iTeste then
            qryOrcxRea.Delete
         else
          begin
             qryOrcxRea.Edit;
             qryOrcxRea.FieldByName('VALORREA').AsFloat    := BuscaValorRea(qryOrcxRea.FieldByName('RECPAG').AsString,qryOrcxRea.FieldByName('CODTIPRECDES').AsString);
             qryOrcxRea.FieldByName('VALORORC').AsFloat    := BuscaValorOrc(qryOrcxRea.FieldByName('RECPAG').AsString,qryOrcxRea.FieldByName('CODTIPRECDES').AsString);
             qryOrcxRea.FieldByName('DIFERENCA').AsFloat   := qryOrcxRea.FieldByName('VALORORC').AsFloat - qryOrcxRea.FieldByName('VALORREA').AsFloat;

             if qryOrcxRea.FieldByName('VALORORC').AsFloat <> 0 then
                qryOrcxRea.FieldByName('PERC').AsFloat     := (((qryOrcxRea.FieldByName('VALORORC').AsFloat - qryOrcxRea.FieldByName('VALORREA').AsFloat)/qryOrcxRea.FieldByName('VALORORC').AsFloat)*100);

             if length(trim(qryOrcxRea.FieldByName('CODTIPRECDES').AsString)) = iGrau then
              begin
                 qryOrcxRea.FieldByName('VALORREASIN').AsFloat := qryOrcxRea.FieldByName('VALORREA').AsFloat*fSinal;
                 qryOrcxRea.FieldByName('VALORORCSIN').AsFloat := qryOrcxRea.FieldByName('VALORORC').AsFloat*fSinal;
                 qryOrcxRea.FieldByName('DIFERENCASIN').AsFloat:= qryOrcxRea.FieldByName('VALORORCSIN').AsFloat - qryOrcxRea.FieldByName('VALORREASIN').AsFloat;
                 qryOrcxRea.FieldByName('VALORREAANA').AsFloat := qryOrcxRea.FieldByName('VALORREA').AsFloat;
                 qryOrcxRea.FieldByName('VALORORCANA').AsFloat := qryOrcxRea.FieldByName('VALORORC').AsFloat;
                 qryOrcxRea.FieldByName('DIFERENCAANA').AsFloat:= qryOrcxRea.FieldByName('DIFERENCA').AsFloat;
              end;

             qryOrcxRea.Post;

             if not cbContasZero.Checked and ((qryOrcxRea.FieldByName('VALORREA').AsFloat = 0)
                and (qryOrcxRea.FieldByName('VALORORC').AsFloat = 0)) then
                qryOrcxRea.Delete
             else
                qryOrcxRea.Next;
         end;
      end;

      if trim(dblkcmbCentro.Text) <> '' then
         ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+deDataInicial.Text+' À '+deDataFinal.Text + ' - '+Trim(dblkcmbCentro.Text)
      else
       if trim(dblcCentroCusto.Text) <> '' then
          ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+deDataInicial.Text+' À '+deDataFinal.Text + ' - '+Trim(dblcCentroCusto.Text)
       else
         ppLabel10.Caption := 'ORÇADO x REALIZADO DE '+deDataInicial.Text+' À '+deDataFinal.Text;

      if cbImprimeCentavos.Checked then
       begin
          rpOrcxReaDBText3.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBText2.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBText4.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaDBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc3.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaDBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc6.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxReaDBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxReaDBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
       end
      else
       begin
          rpOrcxReaDBText3.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBText2.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBText4.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxReaDBCalc1.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc2.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc3.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxReaDBCalc4.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc5.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc6.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxReaDBCalc7.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc8.DisplayFormat := '#,0;(#,0)';
          rpOrcxReaDBCalc9.DisplayFormat := '#,0;(#,0)';
       end;
   end;
end;

procedure TfrmRParamReaxOrc.seGrauMaxCARChange(Sender: TObject);
begin
  inherited;
  sAux:=FloatToStr(seGrauMaxCAR.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAR:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,iAux);
end;

procedure TfrmRParamReaxOrc.seGrauMaxCAPChange(Sender: TObject);
begin
  inherited;
  sAux:=FloatToStr(seGrauMaxCAP.Value);
  iAux:=StrToInt(sAux);
  iNumMaxEleCAP:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,iAux);
end;


function TfrmRParamReaxOrc.BuscaValorRea(sRecPag,sCodTipRecDes:String):Double;
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
   if trim(dblkcmbCentro.Text) <> '' then
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
   if trim(dblkcmbCentro.Text) <> '' then
     qryPrepOrcRea.ParamByName('CODCENTRORESPON').AsString := Trim(dblkcmbCentro.LookupValue)+'%';
   if trim(dblcCentroCusto.Text) <> '' then
     qryPrepOrcRea.ParamByName('CODCENTROCUSTO').AsString := Trim(dblcCentroCusto.LookupValue)+'%';
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.ParamByName('UNIDNEGOC').AsInteger := StrToInt(dblkcmbAtividade.LookupValue);
   qryPrepOrcRea.Open;
   if not qryPrepOrcRea.isEmpty then Result := qryPrepOrcRea.FieldByName('VALORREA').AsFloat;
end;

function TfrmRParamReaxOrc.BuscaValorOrc(sRecPag,sCodTipRecDes:String):Double;
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
   if trim(dblkcmbCentro.Text) <> '' then
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
   if trim(dblkcmbCentro.Text) <> '' then
     qryPrepOrcRea.ParamByName('CODCENTRORESPON').AsString := Trim(dblkcmbCentro.LookupValue)+'%';
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



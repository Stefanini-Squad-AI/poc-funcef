unit FRParamOrcxPrevisto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FRParamReaxOrc, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Mask, wwdbedit, Wwdbspin,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls;

type
  TfrmRParamOrcxPrevisto = class(TfrmRParamReaxOrc)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    function BuscaValorPrev(sRecPag,sCodTipRecDes:String):Double;
  public
    { Public declarations }
  end;

var
  frmRParamOrcxPrevisto: TfrmRParamOrcxPrevisto;

implementation

{$R *.DFM}

uses DRelatoriosCFinan, uSistema, uIntegraBack, uFuncaoGeral;

procedure TfrmRParamOrcxPrevisto.bbtnConfirmarClick(Sender: TObject);
var iTeste,iGrau,iGrauCAR,iGrauCAP : Integer;
    fSinal : Double;
begin
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,1);
   With dtmRelatoriosCFinan do begin
      qryOrcxPrevisto.Close;
      qryOrcxPrevisto.SQL.Clear;
      qryOrcxPrevisto.SQL.Add('SELECT ');
      qryOrcxPrevisto.SQL.Add('  DECODE(FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'',''1. Recebimentos - Pagamentos'') AS GR, ');
      qryOrcxPrevisto.SQL.Add('  DECODE(FLGINDICARECDES,''N'',DECODE(RECPAG, ''R'', ''2.1. Outras Entradas'', ''2.2. Outras Saídas''),DECODE(RECPAG, ''R'', ''1.1. Recebimentos'', ''1.2. Pagamentos'')) AS RP, ');
      qryOrcxPrevisto.SQL.Add('  ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, 0 AS VALORPREV, 0 AS VALORORC,         ');
      qryOrcxPrevisto.SQL.Add('  0 AS DIFERENCA,0 AS PERC, 0 AS VALORPREVSIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,');
      qryOrcxPrevisto.SQL.Add('  0 AS VALORPREVANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA   ');
      qryOrcxPrevisto.SQL.Add('FROM                                                       ');
      qryOrcxPrevisto.SQL.Add('  TIPORECEBDESEMB                                          ');
      qryOrcxPrevisto.SQL.Add('WHERE                                                      ');
      qryOrcxPrevisto.SQL.Add('  (IDPESSOA     = :IDPESSOA)                               ');
      qryOrcxPrevisto.SQL.Add('ORDER BY GR, RP, CODTIPRECDES                              ');
      qryOrcxPrevisto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryOrcxPrevisto.Open;
      qryOrcxPrevisto.First;
      
      While not qryOrcxPrevisto.EOF do begin

         if qryOrcxPrevisto.FieldByName('RECPAG').AsString = 'R' then
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

         if length(trim(qryOrcxPrevisto.FieldByName('CODTIPRECDES').AsString)) > iTeste then
            qryOrcxPrevisto.Delete
         else
          begin
             qryOrcxPrevisto.Edit;
             qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat    :=
                   BuscaValorPrev(qryOrcxPrevisto.FieldByName('RECPAG').AsString,
                                  qryOrcxPrevisto.FieldByName('CODTIPRECDES').AsString);

             qryOrcxPrevisto.FieldByName('VALORORC').AsFloat    :=
                   BuscaValorOrc(qryOrcxPrevisto.FieldByName('RECPAG').AsString,
                                 qryOrcxPrevisto.FieldByName('CODTIPRECDES').AsString);

             qryOrcxPrevisto.FieldByName('DIFERENCA').AsFloat   :=
                   qryOrcxPrevisto.FieldByName('VALORORC').AsFloat -
                   qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat;

             if qryOrcxPrevisto.FieldByName('VALORORC').AsFloat <> 0 then
                qryOrcxPrevisto.FieldByName('PERC').AsFloat     :=
                      (((qryOrcxPrevisto.FieldByName('VALORORC').AsFloat -
                         qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat)/
                         qryOrcxPrevisto.FieldByName('VALORORC').AsFloat)*100);

             if length(trim(qryOrcxPrevisto.FieldByName('CODTIPRECDES').AsString)) = iGrau then
              begin
                 qryOrcxPrevisto.FieldByName('VALORPREVSIN').AsFloat :=
                                 qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat*fSinal;

                 qryOrcxPrevisto.FieldByName('VALORORCSIN').AsFloat :=
                                 qryOrcxPrevisto.FieldByName('VALORORC').AsFloat*fSinal;

                 qryOrcxPrevisto.FieldByName('DIFERENCASIN').AsFloat:=
                                 qryOrcxPrevisto.FieldByName('VALORORCSIN').AsFloat -
                                 qryOrcxPrevisto.FieldByName('VALORPREVSIN').AsFloat;

                 qryOrcxPrevisto.FieldByName('VALORPREVANA').AsFloat :=
                                 qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat;

                 qryOrcxPrevisto.FieldByName('VALORORCANA').AsFloat :=
                                 qryOrcxPrevisto.FieldByName('VALORORC').AsFloat;

                 qryOrcxPrevisto.FieldByName('DIFERENCAANA').AsFloat:=
                                 qryOrcxPrevisto.FieldByName('DIFERENCA').AsFloat;
              end;

             qryOrcxPrevisto.Post;

             if not cbContasZero.Checked and
                ((qryOrcxPrevisto.FieldByName('VALORPREV').AsFloat = 0) and
                (qryOrcxPrevisto.FieldByName('VALORORC').AsFloat = 0)) then
                qryOrcxPrevisto.Delete
             else
               qryOrcxPrevisto.Next;
               
         end;
      end;

      if trim(dblkcmbCentro.Text) <> '' then
          ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+deDataInicial.Text+' À '+deDataFinal.Text + ' - '+Trim(dblkcmbCentro.Text)
      else
       if trim(dblcCentroCusto.Text) <> '' then
          ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+deDataInicial.Text+' À '+deDataFinal.Text + ' - '+Trim(dblcCentroCusto.Text)
       else
          ppLabelTituloRelatorio.Caption := 'ORÇADO x PREVISTO DE '+deDataInicial.Text+' À '+deDataFinal.Text;

      if cbImprimeCentavos.Checked then
       begin
          rpOrcxPrevistoDBText3.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBText2.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBText4.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxPrevistoDBCalc1.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc2.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc3.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxPrevistoDBCalc4.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc5.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc6.DisplayFormat := '#,0.00;(#,0.00)';
          //
          rpOrcxPrevistoDBCalc7.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc8.DisplayFormat := '#,0.00;(#,0.00)';
          rpOrcxPrevistoDBCalc9.DisplayFormat := '#,0.00;(#,0.00)';
       end
      else
       begin
          rpOrcxPrevistoDBText3.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBText2.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBText4.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxPrevistoDBCalc1.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc2.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc3.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxPrevistoDBCalc4.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc5.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc6.DisplayFormat := '#,0;(#,0)';
          //
          rpOrcxPrevistoDBCalc7.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc8.DisplayFormat := '#,0;(#,0)';
          rpOrcxPrevistoDBCalc9.DisplayFormat := '#,0;(#,0)';
       end;
   end;
end;

function TfrmRParamOrcxPrevisto.BuscaValorPrev(sRecPag,sCodTipRecDes:String):Double;
begin
   Result:=0;
   qryPrepOrcRea.Close;
   qryPrepOrcRea.SQL.Clear;
   qryPrepOrcRea.SQL.Add('SELECT ');
   qryPrepOrcRea.SQL.Add('  SUM(DECODE(VALOR,NULL,0,VALOR)) AS VALORPREV              ');
   qryPrepOrcRea.SQL.Add('FROM                                                        ');
   qryPrepOrcRea.SQL.Add('  FLUXOPREVISTO                                             ');
   qryPrepOrcRea.SQL.Add('WHERE                                                       ');
   qryPrepOrcRea.SQL.Add('       (IDPESSOA     = :IDPESSOA)                           ');
   qryPrepOrcRea.SQL.Add('   AND (DATAPROGRAMADA >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (DATAPROGRAMADA <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) ');
   qryPrepOrcRea.SQL.Add('   AND (RTRIM(CODTIPRECDES) LIKE :CODTIPRECDES)             ');
   qryPrepOrcRea.SQL.Add('   AND (RECPAG = :RECPAG)                                   ');
   if trim(dblkcmbCentro.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (RTRIM(CODCENTRORESPON) LIKE :CODCENTRORESPON )   ');
   if trim(dblcCentroCusto.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (RTRIM(CODCENTROCUSTO) LIKE :CODCENTROCUSTO )     ');
   if trim(dblkcmbAtividade.Text) <> '' then
      qryPrepOrcRea.SQL.Add('   AND (UNIDNEGOC = :UNIDNEGOC)                          ');
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
   if not qryPrepOrcRea.isEmpty then Result := qryPrepOrcRea.FieldByName('VALORPREV').AsFloat;

end;

end.

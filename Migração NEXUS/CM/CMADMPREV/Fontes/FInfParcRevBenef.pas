// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina      : (dfm alinhamento edits) CalculaValores
//Pendência   : 128237
//Responsável : Edilaine
//Data        : 23/08/2022
//Descrição   : Data inicial da divida fixa em dia 20 ou proximo dia util
//------------------------------------------------------------------------------
//Pendência   : SOL Nº 228244-16260 PPM Nº 442505
//Responsável : Helio Lima Custodio
//Data        : 31/07/2014
//Descrição   : Parametrização de Parcelamento de Dívida de Benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 226809 KINTANA 2061576
//Responsável : Fernando Xavier
//Data        : 25/03/2014
//Descrição   : Ajustar o erro de calculo.
//------------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.
//------------------------------------------------------------------------------
//  Autor(a)   : Augusto
//  Data       : 19/04/2006
//  Descrição  : Permitir diminuir ou aumentar o numero de parcelas recalculando o valor
//------------------------------------------------------------------------------
//  Rotina     : RubricaBloqueada
//  Autor(a)   : Augusto
//  Data       : 31/05/2005
//  Descrição  : Opção para alterar o numero de parcelas e recalcular valor a parcelar
//------------------------------------------------------------------------------
//  Rotina     : RubricaBloqueada
//  Autor(a)   : Augusto
//  Data       : 23/11/2004
//  Descrição  : Nova função para informar caso a rubrica esteja bloqueada
//------------------------------------------------------------------------------
// Rotina      : ---//--
// Autor(a)    : Leo
// Data        : 04.05.2004
// Descricao   : alteração geral da função
//------------------------------------------------------------------------------

unit FInfParcRevBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Spin, Db, DBTables, Wwquery, wwdblook,
  ComCtrls,UMensErro, uFuncoesUteis,

  Math; //Helio - SOL Nº 228244-16260 PPM Nº 442505

type
  TFrmInfParcRevBenef = class(TfrmOkCancelar)
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    edtSaldoReviInss: TEdit;
    sedQtParcInss: TSpinEdit;
    edtSaldoRevFunc: TEdit;
    sedQtParcFunc: TSpinEdit;
    edtVlParcInss: TEdit;
    edtVlParcFunc: TEdit;
    edtPercParcInss: TEdit;
    edtPercParcFunc: TEdit;
    dtpDataInicioInss: TDateTimePicker;
    dtpDataFimInss: TDateTimePicker;
    dtpDataInicioFunc: TDateTimePicker;
    dtpDataFimFunc: TDateTimePicker;
    lbl13: TLabel;
    edtvlbeneficio: TEdit;
    edtvlbeneficioFuncef: TEdit;
    lbl14: TLabel;
    cbbInss: TComboBox;
    cbbcbmotivofuncef: TComboBox;
    lbl15: TLabel;
    lbl16: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edtVlParcInssExit(Sender: TObject);
    procedure edtPercParcInssExit(Sender: TObject);
    procedure edtVlParcFuncExit(Sender: TObject);
    procedure edtPercParcFuncExit(Sender: TObject);
    function  getPercParc(_Percreducao, _valorBeneficio, _SaldoRevisao : Double; _FONTEPAGADORA : String; _funcionalidade : Integer): Double; //adiciona mais parametros //Helio - SOL Nº 228244-16260 PPM Nº 442505
    procedure CalculaValores(_valor, _perc, _qtParc,_valortotal:double;_edqtparc:TSpinEdit;_edvalor,_edParc:TEdit;_tipo:string;_valorBeneficioNovo:Double);
    procedure FormCreate(Sender: TObject);
    procedure sedQtParcFuncExit(Sender: TObject);
    procedure sedQtParcInssExit(Sender: TObject);
    procedure edtVlParcFuncKeyPress(Sender: TObject; var Key: Char);
    procedure edtVlParcInssKeyPress(Sender: TObject; var Key: Char);
    procedure edtPercParcFuncKeyPress(Sender: TObject; var Key: Char);
    procedure edtPercParcInssKeyPress(Sender: TObject; var Key: Char);
    function BuscarIdmotivo(_motivo:string):Integer;
    procedure GerarMotivo;
    procedure FormActivate(Sender: TObject);
    procedure sedQtParcFuncKeyPress(Sender: TObject; var Key: Char);
    procedure sedQtParcInssKeyPress(Sender: TObject; var Key: Char);
    procedure sedQtParcFuncChange(Sender: TObject);
    procedure sedQtParcInssChange(Sender: TObject);

    //Helio - SOL Nº 228244-16260 PPM Nº 442505
    procedure CalculaValoresParcela(var percentual : Double; vlrAtual, saldoRevisao : Double; var valorParcela : Double; var qtdParcela : Double);

  private
    { Private declarations }
    dTotalCreditos : double;
    dTotalDebitos  : double;
    flgabertura:Boolean;

  public
    { Public declarations }
  erro:Boolean;

  tela:string;
  Alt1,Alt2,Alt3:Boolean;
  end;

var
  FrmInfParcRevBenef: TFrmInfParcRevBenef;
  Function RubricaBloqueada (QryAux: TwwQuery; iIdRubrica : Integer): Boolean;


implementation

uses uDataBase,UAdmPrev, FRetroativoPREV{,fRetroativoPREV};

{$R *.DFM}


procedure TFrmInfParcRevBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

//procedure TFrmInfParcRevBenef.sedNumParcInssChange(Sender: TObject);
//begin
//  inherited;
//    redVlrParcINSS.value :=  redINSSParc.value / sedNumParcInss.value;
//end;
//
//procedure TFrmInfParcRevBenef.sedNumParcBenefChange(Sender: TObject);
//begin
//  inherited;
//  redVlrParcBenef.value :=  redBeneficioParc.value / sedNumParcBenef.value;
//end;
//
//procedure TFrmInfParcRevBenef.sedNumParcContribChange(Sender: TObject);
//begin
//  inherited;
//  redVlrParcContrib.value :=  redContribuicaoParc.value / sedNumParcContrib.value;
//end;

{ Verifica se a rubrica esta bloqueada }
function RubricaBloqueada(QryAux: TwwQuery; iIdRubrica: Integer): Boolean;
Var
  sSQL : String;
begin
  Result := False;
  sSQL := ' SELECT FLGESTADORUB FROM PROVDESC WHERE IDPROVENTO = '+IntToStr(iIdRubrica);
  If FazQuery(QryAux, sSQL) Then Begin
    If QryAux.FieldByName('FLGESTADORUB').AsInteger = 2 Then Result := True;
  End;
end;
procedure TFrmInfParcRevBenef.edtVlParcFuncExit(Sender: TObject);
begin
  inherited;
  


if (edtSaldoRevFunc.text<>'') and (edtSaldoRevFunc.text<>'0.00')and( Alt3 = True)then
   begin

    if edtVlParcFunc.Text <> '' then
       begin
       if strtofloat(edtVlParcFunc.Text)<=0 then
          begin
          MsgDlg('Valor da parcela deverá ser maior ou igual a 1 centavo.','Informação',mtInformation,[mbOk],0);
          edtVlParcFunc.setfocus;
          exit;
          end;
       end;



   if edtVlParcFunc.Text<>'' then
        begin
        Alt3:=False;
        edtVlParcFunc.text:=FormatFloat('0.00',strtofloat(edtVlParcFunc.text));
        CalculaValores(StrToFloat(edtVlParcFunc.Text)
                    ,0
                    ,0
                    ,StrToFloat(edtSaldoRevFunc.text)
                    ,sedQtParcFunc
                    ,edtVlParcFunc
                    ,edtPercParcFunc,'1',StrToFloat(edtvlbeneficioFuncef.text));
        end;
   end;
flgabertura:=false;
end;

procedure TFrmInfParcRevBenef.edtPercParcFuncExit(Sender: TObject);
begin
  inherited;
if (edtSaldoRevFunc.text<>'') and (edtSaldoRevFunc.text<>'0.00')and( Alt1 = True)then
   begin

 //  if (StrToFloat(edtPercParcFunc.text)<2)or(StrToFloat(edtPercParcFunc.Text)>10) then
//       Abort;


   if edtPercParcFunc.Text<>'' then
        begin
        Alt1:=False;
        edtPercParcFunc.text:=FormatFloat('0.00',strtofloat(edtPercParcFunc.text));
        CalculaValores(0
                    ,StrToFloat(edtPercParcFunc.Text)
                    ,0
                    ,StrToFloat(edtSaldoRevFunc.text)
                    ,sedQtParcFunc
                    ,edtVlParcFunc
                    ,edtPercParcFunc,'1',StrToFloat(edtvlbeneficioFuncef.text));
        end;
   end;
flgabertura:=false;   
end;

function TFrmInfParcRevBenef.getPercParc(_Percreducao, _valorBeneficio, _SaldoRevisao :
     Double; _FONTEPAGADORA : String; _funcionalidade : Integer): Double; //adiciona mais parametros //Helio - SOL Nº 228244-16260 PPM Nº 442505
var
  query :TwwQuery;
  //Helio - SOL Nº 228244-16260 PPM Nº 442505
  VerificaSeguinte : Boolean;
  valorParcela, qtdParcela, percentual : Double;
  str_Percreducao : String;
  //FIM Helio - SOL Nº 228244-16260 PPM Nº 442505
begin

//query := TwwQuery.Create(Application);
//query.DataBaseName := 'BaseDados';
//query.close;
//query.SQL.clear;
//query.open;
//query.close;
//query.destroy;

//Helio - SOL Nº 228244-16260 PPM Nº 442505
{comentada forma como era feito antes
if _Percreducao > 30 then
   result:=5
else
   if(_Percreducao>=25) and (_Percreducao<=30) then
   result:=6
   else
      if(_Percreducao>=20) and (_Percreducao<=24) then
       result:=7
      else
      if(_Percreducao>=15) and (_Percreducao<=19) then
         result:=8
       else  
         if(_Percreducao>=11) and (_Percreducao<=14) then
             result:=9
         else
             result:=10;}

    query := TwwQuery.Create(Application);
    query.DataBaseName := 'BaseDados';
    query.close;
    query.SQL.clear;

    str_Percreducao := stringReplace(FloatToStr(_Percreducao), ',', '.', [rfIgnoreCase, rfReplaceAll]);

    query.SQL.Text := 'SELECT * FROM PARAMPARCDIVIDABENEFICIO ' +#13+
                      ' WHERE IDFUNCIONALIDADE = ' + IntToStr(_funcionalidade) +#13+
                      ' AND FONTEPAGADORA = ' + _FONTEPAGADORA +#13+
                      ' AND ' + str_Percreducao + ' >= VLRINICIOFAIXA ' +#13+
                      ' AND ' + str_Percreducao + ' <= VLRFIMFAIXA ' +#13+
                      ' AND SYSDATE >= DTINICIOVIGENCIA ' +#13+
                      ' AND (DTFIMVIGENCIA IS NULL OR SYSDATE <= DTFIMVIGENCIA) ' +#13+
                      ' ORDER BY QTDEPARCFINAL ';

    query.open;

    percentual := 0;

    query.First;
    VerificaSeguinte := True;
    while (not query.Eof) and (VerificaSeguinte) do
    begin
       percentual := query.FieldByName('PERCENTUAL').AsFloat;

       CalculaValoresParcela(percentual,
                             _valorBeneficio,
                             _SaldoRevisao,
                             valorParcela,
                             qtdParcela);

       if not (qtdParcela > query.FieldByName('QTDEPARCFINAL').AsFloat) then
           VerificaSeguinte := False;

       Query.Next;
    end;

    query.close;
    query.Destroy;


    Result := percentual;
//FIM Helio - SOL Nº 228244-16260 PPM Nº 442505
end;



procedure TFrmInfParcRevBenef.FormShow(Sender: TObject);
begin
  inherited;

//  If sedNumParcInss.Value    = 0 Then  sedNumParcInss.Enabled    := False;
//  If sedNumParcBenef.Value   = 0 Then  sedNumParcBenef.Enabled   := False;
//  If sedNumParcContrib.Value = 0 Then  sedNumParcContrib.Enabled := False;
end;

procedure TFrmInfParcRevBenef.bbtnConfirmarClick(Sender: TObject);
begin
erro:=False;
if (edtSaldoReviInss.Text<>'0') and (edtSaldoReviInss.Text<>'')then
   begin

   // edilaine - 22/01/2014 - SOL 174933
   if ((StrToInt(sedQtParcInss.Text)) < 1 ) then // SOL 226809 KINTANA 2061576
       begin
       MsgDlg('Quantidade de Parcelas deverá ser maior ou igual a 1.','Erro',mtError,[mbOk,mbHelp],0);
       sedQtParcInss.setfocus;
       erro:=True;
       end;
   // edilaine - 22/01/2014 - SOL 174933 - fim

   if ((Trim(edtVlParcInss.Text)='') or (Trim(edtVlParcInss.Text)='0.00')) or
      ((Trim(edtPercParcInss.Text)='') or (Trim(edtPercParcInss.Text)='0.00')) or
      {((Trim(sedQtParcInss.Text)='') or (Trim(sedQtParcInss.Text)='0')) or}
      ((Trim(DateToStr(dtpDataInicioInss.DateTime) )=''))  or
      ((Trim(DateToStr(dtpDataFimInss.DateTime))='')) then
       begin
       MsgDlg('Os campos Saldo Revisão INSS, Valor Parcela, Percentual, Quantidade de Parcelas, Início e Fim são obrigatórios.','Erro',mtError,[mbOk,mbHelp],0);
       edtVlParcInss.setfocus;
       erro:=True;
       end;

   end
else if (edtSaldoRevFunc.Text<>'0') and (edtSaldoRevFunc.Text<>'') then
   begin

   // edilaine - 22/01/2014 - SOL 174933
   if ((StrToInt(sedQtParcFunc.Text)) < 1 ) then  // SOL 226809 KINTANA 2061576
       begin
       MsgDlg('Quantidade de Parcelas deverá ser maior ou igual a 1.','Erro',mtError,[mbOk,mbHelp],0);
       sedQtParcFunc.setfocus;
       erro:=True;
       end;
   // edilaine - 22/01/2014 - SOL 174933 - fim

   if ((Trim(edtVlParcFunc.Text)='') or (Trim(edtVlParcFunc.Text)='0.00')) or
      ((Trim(edtPercParcFunc.Text)='') or (Trim(edtPercParcFunc.Text)='0.00')) or
      {((Trim(sedQtParcFunc.Text)='') or (Trim(sedQtParcFunc.Text)='0')) or}
      ((Trim(DateToStr(dtpDataInicioFunc.datetime))=''))  or
      ((Trim(DateToStr(dtpDataFimFunc.datetime))='')) then
      begin
       MsgDlg('Os campos Saldo Revisão Funcef, Valor Parcela, Percentual, Quantidade de Parcelas, Início e Fim são obrigatórios.','Erro',mtError,[mbOk,mbHelp],0);
       edtVlParcFunc.setfocus;
      erro:=True;
       end;

   end
   else
  inherited;

end;

procedure TFrmInfParcRevBenef.edtVlParcInssExit(Sender: TObject);
begin
  inherited;



if (edtSaldoReviInss.text<>'') and (edtSaldoReviInss.text<>'0.00')and( Alt3 = True)then
   begin

   if edtVlParcInss.Text <> '' then
       begin
       if strtofloat(edtVlParcInss.Text)<=0 then
          begin
          MsgDlg('Valor da parcela deverá ser maior ou igual a 1 centavo.','Informação',mtInformation,[mbOk],0);
          edtVlParcInss.setfocus;
          exit;
          end;
       end;




   if edtVlParcInss.Text<>'' then
        begin

        Alt3:=False;
        edtVlParcInss.text:=FormatFloat('0.00',strtofloat(edtVlParcInss.text));
        CalculaValores(StrToFloat(edtVlParcInss.Text)
                    ,0
                    ,0
                    ,StrToFloat(edtSaldoReviInss.text)
                    ,sedQtParcInss
                    ,edtVlParcInss
                    ,edtPercParcInss,'2',StrToFloat(edtvlbeneficio.text));
       end;
   end;
end;

procedure TFrmInfParcRevBenef.edtPercParcInssExit(Sender: TObject);
begin
  inherited;
if (edtSaldoReviInss.text<>'') and (edtSaldoReviInss.text<>'0.00')and( Alt1 = True)then
   begin

//    if (StrToFloat(edtPercParcInss.text)<2)or(StrToFloat(edtPercParcInss.text)>30) then
//       Abort;



   if edtPercParcInss.Text<>'' then
        begin
        Alt1:=False;
        edtPercParcInss.text:=FormatFloat('0.00',strtofloat(edtPercParcInss.text));

        CalculaValores(0
                    ,StrToFloat(edtPercParcInss.Text)
                    ,0
                    ,StrToFloat(edtSaldoReviInss.text)
                    ,sedQtParcInss
                    ,edtVlParcInss
                    ,edtPercParcInss,'2',StrToFloat(edtvlbeneficio.text));
        end;
   end;
end;



procedure TFrmInfParcRevBenef.CalculaValores(_valor, _perc, _qtParc,
  _valortotal: double; _edqtparc: TSpinEdit; _edvalor, _edParc: TEdit;_tipo:string;_valorBeneficioNovo:Double);

  // edilaine - 22/01/2014 - SOL 174933
  function  iif(condicao : boolean; vlrTrue, vlrFalse : extended) : extended;
  begin
    if condicao then
       result := vlrTrue
    else
       result := vlrFalse;
  end;

var
qtParcParam,i:integer;
dataFinal:string;
begin
qtParcParam:=0;

if _valor> 0 then
   begin
   _edvalor.Text:=formatfloat('0.00',_valor);

   _edqtparc.Text:=FloatToStr(trunc(_valortotal/strtofloat(_edvalor.text)));
    if _valorBeneficioNovo = 0 then
    _edParc.Text:='0,00'
    else
   _edParc.Text:=formatfloat('0.00',(((_valor*100)/_valorBeneficioNovo)));
//   _edParc.Text:=formatfloat('0.00',100-(ABS((_valor*100)/_valorBeneficioNovo-100)));

   end
else
   if _perc> 0 then
       begin

       //Helio - SOL Nº 228244-16260 PPM Nº 442505
       CalculaValoresParcela(_perc,
                      _valorBeneficioNovo,
                      _valortotal,
                      _valor,
                      _qtParc);

       _edParc.Text:=formatfloat('0.00',(_perc));
       _edvalor.Text:=formatfloat('0.00',(_valor));
       _edqtparc.Text:=FloatToStr(_qtParc);

       //calcula outra vez de acordo
       //a quantidade de parcelas
       CalculaValores(0,
                      0,
                      _qtParc,
                     _valortotal,
                     _edqtparc,
                     _edvalor,
                     _edParc,_tipo,_valorBeneficioNovo);

      { _edParc.Text:=formatfloat('0.00',(_perc));

       _edvalor.Text:=formatfloat('0.00',(_valorBeneficioNovo*(_perc/100)));


       _edqtparc.Text:=FloatToStr(trunc(_valortotal/iif(strtofloat(_edvalor.text) <> 0, strtofloat(_edvalor.text),1)));   // edilaine - 22/01/2014 - SOL 174933

          if StrToFloat(_edqtparc.Text) > 2500 then // SOL 226809 KINTANA 2061576
             _edqtparc.Text := '2500';

        if StrToFloat(_edvalor.Text)>_valortotal then
           begin
           _edvalor.Text:=floattostr(_valortotal);


            CalculaValores(_valortotal
                          ,0
                          ,0
                          ,StrToFloat(edtSaldoReviInss.text)
                          ,sedQtParcInss
                          ,edtVlParcInss
                          ,edtPercParcInss,'2',StrToFloat(edtvlbeneficio.text));

           end; }

       //FIM Helio - SOL Nº 228244-16260 PPM Nº 442505
       end
   else
       if _qtParc> 0 then
           begin


           _edqtparc.Text:=FloatToStr(trunc(_qtParc));
           if StrToFloat(_edqtparc.Text) > 2500 then // SOL 226809 KINTANA 2061576
              _edqtparc.Text := '2500';


           _edvalor.Text:=formatfloat('0.00',(_valortotal/_qtParc));

           if _valorBeneficioNovo = 0 then
             _edParc.Text:='0,00'
           else
           _edParc.Text:=formatfloat('0.00',(((strtofloat(_edvalor.text)*100)/_valorBeneficioNovo)));
//           _edParc.Text:=formatfloat('0.00',100-(ABS((strtofloat(_edvalor.text)*100)/_valorBeneficioNovo-100)));


           end;

qtParcParam:=StrToInt(_edqtparc.Text);
//dtpDataInicioInss.Datetime:=(Int(FrmInfParcRevBenef.dtpDataInicioInss.Datetime)+qtParcParam);
//
//
//ProximoAnoMes(SStrToInt(Copy(DateToStr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime),6,2))
//StrToInt(Copy(DateToStr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime),1,4)));

dataFinal:=datetostr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime);
for i:= 1 to qtParcParam-1 do
    begin
    dataFinal:=ProximoAnoMes(StrToInt(Copy(dataFinal,4,2)),
    StrToInt(Copy(dataFinal,7,4)));
    dataFinal:=Copy(datetostr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime),1,2)+'/'+Copy(dataFinal, 6,2)+'/'+(Copy(dataFinal, 1,4));
    end;

//dataFinal:=ProximoAnoMes(StrToInt(Copy(dataFinal,4,2)),StrToInt(Copy(dataFinal,7,4)));
//dataFinal:=Copy(datetostr(FrmInfParcRevBenef.dtpDataInicioInss.Datetime),1,2)+'/'+Copy(dataFinal, 6,2)+'/'+(Copy(dataFinal, 1,4));

dataFinal := '20/'+Copy(dataFinal, 4,7);     //edilaine SIG128237
dataFinal := GetDiaUtil(dataFinal,0);        //edilaine SIG128237

dtpDataFimInss.Datetime:=strtodate(dataFinal);
dtpDataFimFunc.Datetime:=strtodate(dataFinal);

if _tipo = '1' then
    begin
      if (strtofloat(_edParc.Text)<strtofloat('2,00')) or
         (strtofloat(_edParc.Text)>strtofloat('10,00'))then
      //   Abort;////colocar msg?  // SOL 226809 KINTANA 2061576
     end;

flgabertura :=false;
end;

procedure TFrmInfParcRevBenef.FormCreate(Sender: TObject);
begin
  inherited;
  flgabertura:=True;

  cbbInss.Clear;
  cbbcbmotivofuncef.Clear;





end;

procedure TFrmInfParcRevBenef.sedQtParcFuncExit(Sender: TObject);
begin
  inherited;
if (edtSaldoRevFunc.text<>'') and (edtSaldoRevFunc.text<>'0.00')and( Alt2 = True)then
   begin
   Alt2:=false;
   if (sedQtParcFunc.Text<>'')and (flgabertura = False)  then
        CalculaValores(0
                    ,0
                    ,StrToFloat(sedQtParcFunc.Text)
                    ,StrToFloat(edtSaldoRevFunc.text)
                    ,sedQtParcFunc
                    ,edtVlParcFunc
                    ,edtPercParcFunc,'1',StrToFloat(edtvlbeneficioFuncef.text));
   end;

flgabertura :=false;    
end;

procedure TFrmInfParcRevBenef.sedQtParcInssExit(Sender: TObject);
begin
  inherited;
if (edtSaldoReviInss.text<>'') and (edtSaldoReviInss.text<>'0.00')and( Alt2 = True)then
   begin

   Alt2:=false;
   if (sedQtParcInss.Text<>'') and (flgabertura = False) then
        CalculaValores(0
                    ,0
                    ,StrToFloat(sedQtParcInss.Text)
                    ,StrToFloat(edtSaldoReviInss.text)
                    ,sedQtParcInss
                    ,edtVlParcInss
                    ,edtPercParcInss,'2',StrToFloat(edtvlbeneficio.text));
flgabertura :=false;
   end;
end;
procedure TFrmInfParcRevBenef.edtVlParcFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt3:=True;     
end;

procedure TFrmInfParcRevBenef.edtVlParcInssKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt3:=True;     
end;

procedure TFrmInfParcRevBenef.edtPercParcFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt1:=True;     
end;

procedure TFrmInfParcRevBenef.edtPercParcInssKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt1:=True;     
end;

function TFrmInfParcRevBenef.BuscarIdmotivo(_motivo: string): Integer;
var
  query:TwwQuery;
begin

query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.Sql.Clear;

query.SQL.Add('SELECT IDMOTIVO, DESCRICAO');
query.SQL.Add('FROM MOTIVO WHERE FLGTIPO = ''P''');
query.SQL.Add(' AND DESCRICAO = '+#39+_motivo+#39);
query.Active:=True;

Result:=STRTOINT(query.fieldbyname('IDMOTIVO').Text);

query.Active:=False;
query.Destroy;

end;

procedure TFrmInfParcRevBenef.GerarMotivo;
var
  query:TwwQuery;
begin

query:=TwwQuery.Create(Self);
query.DataBaseName :='BaseDados';
query.Active:=false;
query.Sql.Clear;

query.SQL.Add('SELECT IDMOTIVO, DESCRICAO');
query.SQL.Add('FROM MOTIVO WHERE FLGTIPO = ''P''');
query.SQL.Add('ORDER BY DESCRICAO');
query.Active:=True;


query.First;
while not query.Eof do
   begin
   cbbInss.Items.Add(query.fieldbyname('DESCRICAO').Text);
   cbbcbmotivofuncef.Items.Add(query.fieldbyname('DESCRICAO').Text);
   query.Next;
   end;

query.Active:=False;
query.Destroy;     

end;

procedure TFrmInfParcRevBenef.FormActivate(Sender: TObject);
begin
  inherited;
  if (edtvlbeneficioFuncef.Text<>'0,00') and (edtvlbeneficioFuncef.Text<>'') then
     begin
     edtVlParcInss.visible:=false;
     edtPercParcInss.visible:=false;
     sedQtParcInss.visible:=false;
     dtpDataInicioInss.visible:=false;
     dtpDataFimInss.visible:=false;
     cbbInss.visible:=false;
     edtvlbeneficio.visible:=false;
     edtSaldoReviInss.visible:=false;
     lbl13.visible:=false;
     lbl1.visible:=false;
     lbl2.visible:=false;
     lbl5.visible:=false;
     lbl6.visible:=false;
     lbl15.visible:=false;
     lbl3.visible:=false;
     lbl4.visible:=false;

     edtvlbeneficioFuncef.visible:=True;
     edtVlParcFunc.visible:=True;
     edtPercParcFunc.visible:=True;
     sedQtParcFunc.visible:=True;
     dtpDataInicioFunc.visible:=True;
     dtpDataFimFunc.visible:=True;
     cbbcbmotivofuncef.visible:=True;
     edtSaldoRevFunc.visible:=True;
     lbl14.visible:=True;
     lbl7.visible:=True;
     lbl8.visible:=True;
     lbl11.visible:=True;
     lbl12.visible:=True;
     lbl16.visible:=True;
     lbl9.visible:=True;
     lbl10.visible:=True;

     end
 else
     begin

     edtVlParcInss.visible:=True;
     edtPercParcInss.visible:=True;
     sedQtParcInss.visible:=True;
     dtpDataInicioInss.visible:=True;
     dtpDataFimInss.visible:=True;
     cbbInss.visible:=True;
     edtvlbeneficio.visible:=True;
     edtSaldoReviInss.visible:=True;
     lbl13.visible:=True;
     lbl1.visible:=True;
     lbl2.visible:=True;
     lbl5.visible:=True;
     lbl6.visible:=True;
     lbl15.visible:=True;
     lbl3.visible:=True;
     lbl4.visible:=True;

     edtvlbeneficioFuncef.visible:=false;
     edtVlParcFunc.visible:=false;
     edtPercParcFunc.visible:=False;
     sedQtParcFunc.visible:=false;
     dtpDataInicioFunc.visible:=false;
     dtpDataFimFunc.visible:=false;
     cbbcbmotivofuncef.visible:=false;
     edtSaldoRevFunc.visible:=false;
     lbl14.visible:=false;
     lbl7.visible:=false;
     lbl8.visible:=false;
     lbl11.visible:=false;
     lbl12.visible:=false;
     lbl16.visible:=false;
     lbl9.visible:=false;
     lbl10.visible:=false;

//     edtVlParcInss.Enabled:=true;
//     edtPercParcInss.Enabled:=true;
//     sedQtParcInss.Enabled:=true;
//     dtpDataInicioInss.Enabled:=true;
//     dtpDataFimInss.Enabled:=true;
//     cbbInss.Enabled:=true;
//
//     edtVlParcFunc.Enabled:=false;
//     edtPercParcFunc.Enabled:=false;
//     sedQtParcFunc.Enabled:=false;
//     dtpDataInicioFunc.Enabled:=false;
//     dtpDataFimFunc.Enabled:=false;
//     cbbcbmotivofuncef.Enabled:=false;


     end;

  if tela='2'then///calculo retro
     begin
     cbbInss.visible:=true;
     cbbcbmotivofuncef.visible:=true;
     lbl16.visible:=True;
     lbl15.visible:=True;

     end
  else 
     begin
     cbbInss.visible:=false;
     cbbcbmotivofuncef.visible:=false;
     lbl16.visible:=false;
     lbl15.visible:=false;
    end;


end;

procedure TFrmInfParcRevBenef.sedQtParcFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt2:=True;
end;

procedure TFrmInfParcRevBenef.sedQtParcInssKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
Alt2:=True;
end;

procedure TFrmInfParcRevBenef.sedQtParcFuncChange(Sender: TObject);
begin
  inherited;
 Alt2:=True;
end;

procedure TFrmInfParcRevBenef.sedQtParcInssChange(Sender: TObject);
begin
  inherited;
 Alt2:=True;
end;

//Helio - SOL Nº 228244-16260 PPM Nº 442505
procedure TFrmInfParcRevBenef.CalculaValoresParcela(var percentual : Double;
   vlrAtual, saldoRevisao : Double; var valorParcela : Double; var qtdParcela : Double);
begin
   valorParcela := 0;
   qtdParcela := 0;

   valorParcela := vlrAtual * (percentual/100);

   if valorParcela <> 0 then
     qtdParcela := Ceil(saldoRevisao/valorParcela);

   if qtdParcela = 1 then
      valorParcela := saldoRevisao;

   if vlrAtual <> 0 then
     percentual := (valorParcela/vlrAtual) * 100
   else
     percentual := 0;

end;

end.

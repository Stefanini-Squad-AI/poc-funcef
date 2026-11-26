// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
// Alteracao   : CalculaValores,edtqtparcExit
// Pendência   : WO13993
// Responsável : Helen V Bianchi
// Data        : 16/09/2024
// Descrição   : Ajuste na rotina
// -----------------------------------------------------------------------------
// Alteracao   : edtvlParcelaExit, edtSaldoAtuExit, edtSldProvisaoExit
// Pendência   : 126276
// Responsável : Edilaine
// Data        : 03/08/2023
// Descrição   : Historico de Movimentos da Divida
// -----------------------------------------------------------------------------
// Alteracao   : (dfm tsDividaBenef)
// Pendência   : 115304
// Responsável : edilaine
// Data MERGE  : 25/01/2023
// Data        : 21/10/2021
// Descrição   : Inclusão de tratamento para contabilização da Provisão de Perdas
// --------------------------------------------------------------------------------
//Pendência   : SOL 226903/15867 KINTANA 2061652
//Responsável : Douglas Siqueira
//Data        : 27/03/2014
//Descrição   : Alteração na gravação do valor previsto / valor parcela.
// -----------------------------------------------------------------------------
//  Autor(a)   : Fábio Henrique Beccaria Sampaio
//  Data       : 16/01/2014
//  SOL        : 174933
//  Descrição  : Permitir A quantidade de parcelas maior que 96
//               Efetuar o calculo caso ocorrer alteração Data Início de Cobrança
// -----------------------------------------------------------------------------
//Pendência   : SOL 174933 KINTANA 1733374
//Responsável : Douglas Siqueira
//Data        : 10/01/2014
//Descrição   : Controle de Saldo devedor.


unit FHstDivBenefAltOpcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Spin, Db, DBTables, Wwquery, wwdblook,
  ComCtrls,UMensErro, uFuncoesUteis;

type
  TFrmHstDivBenefAltOpcao = class(TfrmOkCancelar)
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
    edtperc: TRealEdit;
    edtsaldoinici: TRealEdit;
    edtSaldoAtu: TRealEdit;
    edtqtparc: TEdit;
    edtvlParcela: TRealEdit;
    rgAtuSaldo: TRadioGroup;
    cboNCobra_D: TwwDBLookupCombo;
    dtpDataInicioFunc: TDateTimePicker;
    dtpDataFimFunc: TDateTimePicker;
    Label1: TLabel;
    edtSldProvisao: TRealEdit;
    Label2: TLabel;
    edtSldBaixa: TRealEdit;
      procedure edtpercKeyPress(Sender: TObject; var Key: Char);
    procedure edtsaldoiniciKeyPress(Sender: TObject; var Key: Char);
    procedure edtSaldoAtuKeyPress(Sender: TObject; var Key: Char);
    procedure edtqtparcKeyPress(Sender: TObject; var Key: Char);
    procedure edtvlParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure CalculaValores(_valor, _perc, _qtParc,_valortotal:double;_edqtparc : TEdit; _edvalor,_edPerc:TRealEdit;_tipo:string;_valorBeneficioNovo:Double);
    procedure edtpercExit(Sender: TObject);
    procedure edtvlParcelaExit(Sender: TObject);
    procedure edtqtparcExit(Sender: TObject);
    procedure edtSaldoAtuExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtpercChange(Sender: TObject);
    procedure edtqtparcChange(Sender: TObject);
    procedure edtvlParcelaChange(Sender: TObject);
    procedure dtpDataInicioFuncExit(Sender: TObject);
    procedure edtSldProvisaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHstDivBenefAltOpcao: TFrmHstDivBenefAltOpcao;
  abertura:Boolean;
  Alt1,Alt2,Alt3:Boolean;

implementation

   uses
     FHstDividaBenef3,UAdmPrev;

{$R *.DFM}

procedure TFrmHstDivBenefAltOpcao.edtpercKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
  abertura := False;
  Alt1 := True;
end;

procedure TFrmHstDivBenefAltOpcao.edtsaldoiniciKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltOpcao.edtSaldoAtuKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltOpcao.edtqtparcKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
abertura:=False;

Alt2:=True;
end;

procedure TFrmHstDivBenefAltOpcao.edtvlParcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
  abertura:=False;
  Alt3:=True;
end;

procedure TFrmHstDivBenefAltOpcao.CalculaValores(_valor, _perc, _qtParc,
  _valortotal: double; _edqtparc : TEdit; _edvalor, _edPerc: TRealEdit; _tipo: string;
  _valorBeneficioNovo: Double);

var
  qtParcParam,i:integer;
  dataFinal:string;
begin
  qtParcParam:=0;

  if _valor> 0 then
    begin
     _edvalor.Text:=formatfloat('0.00',_valor);

     _edqtparc.Text:=FloatToStr((round(_valortotal/strtofloat(_edvalor.text)))+FrmHstDividaBenef3.query_cab.fieldbyname('QUANTIDADEPARCELASPAGAS').AsFloat);

     _edPerc.Text:=formatfloat('0.00',(((_valor*100)/_valorBeneficioNovo)));

    end
  else
    if _perc> 0 then
         begin
         _edPerc.Text:=formatfloat('0.00',(_perc));

         _edvalor.Text:=formatfloat('0.00',(_valorBeneficioNovo*(_perc/100)));


         _edqtparc.Text:=FloatToStr((round(_valortotal/strtofloat(_edvalor.text)))+FrmHstDividaBenef3.query_cab.fieldbyname('QUANTIDADEPARCELASPAGAS').asfloat);


          if StrToFloat(_edvalor.Text)>_valortotal then
             begin
             _edvalor.Text:=floattostr(_valortotal);


            CalculaValores(_valortotal
                          ,0
                          ,0
                          ,Str2Float(edtSaldoAtu.text)   // StrToFloat(edtSaldoAtu.text)     //edilaine SIG128237
                          ,edtqtparc
                          ,edtvlParcela
                          ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,(_valorBeneficioNovo));

             end;


         end
     else
         if _qtParc> 0 then
             begin


             _edqtparc.Text:=FloatToStr(trunc(_qtParc));

             _edvalor.Text:=formatfloat('0.00',(_valortotal/(_qtParc-FrmHstDividaBenef3.query_cab.fieldbyname('QUANTIDADEPARCELASPAGAS').asfloat)));

              if _valorBeneficioNovo  > 0 then        //edilaine SIG126276

                 //_edPerc.Text:=formatfloat('0.00',(((strtofloat(_edvalor.text)*100)/_valorBeneficioNovo))); //Helen - WO13993
                 _edPerc.Text:=formatfloat('0.00',(((Str2Float(_edvalor.text)*100)/_valorBeneficioNovo))); //Helen - WO13993

             end;


  qtParcParam:=StrToInt(_edqtparc.Text);


  dataFinal:=datetostr(dtpDataInicioFunc.Datetime);
  for i:= 1 to qtParcParam-1 do
      begin
      dataFinal:=ProximoAnoMes(StrToInt(Copy(dataFinal,4,2)),
      StrToInt(Copy(dataFinal,7,4)));
      dataFinal:=Copy(datetostr(dtpDataInicioFunc.Datetime),1,2)+'/'+Copy(dataFinal, 6,2)+'/'+(Copy(dataFinal, 1,4));
      end;

  //dtpDataFimInss.Datetime:=strtodate(dataFinal);
  dtpDataFimFunc.Datetime:=strtodate(dataFinal);

  if _tipo = '1' then
      begin
        if (strtofloat(_edPerc.Text)<strtofloat('2,00')) or
           (strtofloat(_edPerc.Text)>strtofloat('10,00'))then
           Abort;
       end;


  // FHBS - 16/01/2014 - SOL 174933
  //if  StrToInt(_edqtparc.Text)>96 then
  //  begin
  //  edtqtparc.Text:='96';
  //  CalculaValores(0
  //              ,0
  //              ,strToFloat(edtqtparc.Text)
  //              ,StrToFloat(edtSaldoAtu.text)
  //              ,edtqtparc
  //              ,edtvlParcela
  //              ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text));
  //
  //
  //  end;

end;

procedure TFrmHstDivBenefAltOpcao.edtpercExit(Sender: TObject);
begin
  inherited;
  if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0.00') and( Alt1 = True)then
     begin

  ///verificar fonte pagadora
   if edtperc.Text<>'' then
        begin
        Alt1 := False;
        edtperc.text:=FormatFloat('0.00',strtofloat(edtperc.text));
        CalculaValores(0
                    ,StrToFloat(edtperc.Text)
                    ,0
                    ,Str2Float(edtSaldoAtu.text)   // StrToFloat(edtSaldoAtu.text)                   //edilaine SIG128237
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,
                    //StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text)    //edilaine SIG128237
                    FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').AsFloat               //edilaine SIG128237
                    );
        end;
   end;
end;

procedure TFrmHstDivBenefAltOpcao.edtvlParcelaExit(Sender: TObject);
begin
  inherited;
  if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0,00')and( Alt3 = True)then
     begin

  ///verificar fonte pagadora
   if edtvlParcela.Text<>'' then
        begin
        Alt3 := false;
        edtvlParcela.text:=FormatFloat('0.00',str2float(edtvlParcela.text));              //edilaine SIG126276
        CalculaValores(Str2Float(edtvlParcela.Text)    // strToFloat(edtvlParcela.Text)   //edilaine SIG126276
                    ,0
                    ,0
                    ,Str2Float(edtSaldoAtu.text)   // StrToFloat(edtSaldoAtu.text)                   //edilaine SIG128237
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,
                    //StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text)    //edilaine SIG128237
                    FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').AsFloat               //edilaine SIG128237
                    );
        end;
   end;
end;

procedure TFrmHstDivBenefAltOpcao.edtqtparcExit(Sender: TObject);
begin
  inherited;
   //WO13993 - Helen V Bianchi - Inicio
   if str2float(edtqtparc.text) <= FrmHstDividaBenef3.query_cab.fieldbyname('QUANTIDADEPARCELASPAGAS').asfloat then
   begin
        MsgDlg('Qtde de Parcelas deve ser maior que o número de Parcelas já Pagas.','Informação',mtInformation,[mbOk],0);
        edtqtparc.SetFocus;
        exit;
   end;
   //WO13993 - Helen V Bianchi - Inicio
  if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0.00') and( Alt2 = True)then
     begin

    ///verificar fonte pagadora

   if edtqtparc.Text<>'' then
        begin
        Alt2 := false;
        // FHBS - 16/01/2014 - SOL 174933
        //if strtofloat(edtqtparc.text)>96 then
        //   edtqtparc.text:='96';

        if str2float(edtqtparc.text)<1 then    //edilaine SIG126276
           edtqtparc.text:='1';

        edtqtparc.text:=FormatFloat('0',str2float(edtqtparc.text));    //edilaine SIG126276
        CalculaValores(0
                    ,0
                    ,str2Float(edtqtparc.Text)      //edilaine SIG126276
                    ,Str2Float(edtSaldoAtu.text)   // StrToFloat(edtSaldoAtu.text)                   //edilaine SIG128237
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,
                    //StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text)    //edilaine SIG128237
                    FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').AsFloat               //edilaine SIG128237
                    );
        end;
   end;
end;

procedure TFrmHstDivBenefAltOpcao.edtSaldoAtuExit(Sender: TObject);
begin
  inherited;
  IF edtSaldoAtu.text<>'' THEN
     edtSaldoAtu.text:=formatfloat('0.00',str2float(edtSaldoAtu.text));   //edilaine SIG126276
end;

procedure TFrmHstDivBenefAltOpcao.FormActivate(Sender: TObject);
begin
  inherited;
//  try
//    if FrmHstDividaBenef3.qryLkPORTADORFORMA.Active then FrmHstDividaBenef3.qryLkPORTADORFORMA.Close;
//      FrmHstDividaBenef3.qryLkPORTADORFORMA.open;
//  except
//    MsgDlg('Erro ao abrir lookup ','Error',mtError,[mbok],0);
//    Abort;
//  end;
  FrmHstDividaBenef3.qrydet.edit;
  abertura:=True;
   Alt1:=false;
   Alt2:=false;
   Alt3:=false;
end;

procedure TFrmHstDivBenefAltOpcao.edtpercChange(Sender: TObject);
begin
  inherited;


{if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0.00')and(abertura=False)then
   begin

  ///verificar fonte pagadora
   if edtperc.Text<>'' then
        begin
        abertura:=False;

        edtperc.text:=FormatFloat('0.00',strtofloat(edtperc.text));
        CalculaValores(0
                    ,StrToFloat(edtperc.Text)
                    ,0
                    ,StrToFloat(edtSaldoAtu.text)
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text));
        end;
   end;}
end;

procedure TFrmHstDivBenefAltOpcao.edtqtparcChange(Sender: TObject);
begin
  inherited;

{
if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0.00')and(abertura=False)then
   begin

  ///verificar fonte pagadora

   if edtqtparc.Text<>'' then
        begin
        abertura:=False;
        if strtofloat(edtqtparc.text)>96 then
           edtqtparc.text:='96';

        if strtofloat(edtqtparc.text)<1 then
           edtqtparc.text:='1';

        edtqtparc.text:=FormatFloat('0',strtofloat(edtqtparc.text));
        CalculaValores(0
                    ,0
                    ,strToFloat(edtqtparc.Text)
                    ,StrToFloat(edtSaldoAtu.text)
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text));
        end;
   end; }
end;

procedure TFrmHstDivBenefAltOpcao.edtvlParcelaChange(Sender: TObject);
begin
  inherited;
  
  
{if (edtSaldoAtu.text<>'') and (edtSaldoAtu.text<>'0.00')and(abertura=False)then
   begin

  ///verificar fonte pagadora
   if edtvlParcela.Text<>'' then
        begin
        abertura:=False;
        edtvlParcela.text:=FormatFloat('0.00',strtofloat(edtvlParcela.text));
        CalculaValores(strToFloat(edtvlParcela.Text)
                    ,0
                    ,0
                    ,StrToFloat(edtSaldoAtu.text)
                    ,edtqtparc
                    ,edtvlParcela
                    ,edtperc,FrmHstDividaBenef3.query_cab.fieldbyname('FONTEPAGADORA').text,StrToFloat(FrmHstDividaBenef3.query_cab.fieldbyname('VALORBENEFICIO').text));
        end;
   end; }
end;

procedure TFrmHstDivBenefAltOpcao.dtpDataInicioFuncExit(Sender: TObject);
begin
  inherited;
  // FHBS - 16/01/2014 - SOL 174933
  Alt2 := True;
  edtqtparcExit(edtqtparc);
end;

//edilaine - SIG115304 : inicio
procedure TFrmHstDivBenefAltOpcao.edtSldProvisaoExit(Sender: TObject);
var
  rProvisao, rSaldo : double;
begin
  inherited;
  rProvisao := 0;
  rSaldo    := 0;

  if edtSldProvisao.text <> '' then
     rProvisao := Str2Float(edtSldProvisao.text);        //edilaine SIG126276
  if edtSaldoAtu.text <> '' then
     rSaldo := Str2Float(edtSaldoAtu.text);              //edilaine SIG126276

  if (rProvisao < rSaldo) then
  begin
    MsgDlg('O Saldo de Provisão não pode ser menor que o Saldo Atual da Dívida.','Informação',mtInformation,[mbOk],0);
    edtSldProvisao.SetFocus;
  end;
end;

end.



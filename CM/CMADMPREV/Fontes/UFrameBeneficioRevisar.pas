// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************


{-------------------------------------------------------------------------------
Alteração  : (dfm qrys DadosBeneficio e qryFrame, dbgrdDadosBeneficioFuncef)
Nº WO......: WO22176
Data.......: 20/05/2025
Responsável: edilaine
Descrição..: Alterar o percentual aplicado para concessão de Pensão Reg/Replan
             (atualmente o beneficio calcula 80% do valor cheio antes de ratear
             pelo grupo familiar. A nova regra estipula 50%+10% por dependente,
             limitado a 80%. Para 2 dependentes, o beneficio será 70% do cheio)
------------------------------------------------------------------------------
Alteração  : (.dfm) edMesAno
Nº SOL.....: 269943
KTN / PPM  : 1323444
Data       : 02/03/2016
Responsável: Peterson Victor
Descrição..: nao esta levando em consideracao Revisao Por Mês Cobrança do Reembolso do INSS
{--------------------------------------------------------------------------------
Alteração  : ProcessaAlteracaoDadosBeneficio
Nº SOL.....: 253577-18149
KTN / PPM  : 1318909
Data       : 14/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - na revisão do beneficio,
	     a alteração na data de inicio do benefício tem que refletir na data
             inicial das contribuições
-------------------------------------------------------------------------------
Alteração  :
Nº SOL.....: 269621
KTN / PPM  : 1303043
Data       : 24/02/2016
Responsável: Peterson Victor
Descrição..: beneficio INSS nao calcula percentual corretamente
{-------------------------------------------------------------------------------
Alteração  : dbgrdDadosBeneficioFuncefFieldChanged
Nº SOL.....: 268941
KTN / PPM  : 1271559
Data       : 03/02/2016
Responsável: William Moreira
Descrição..: critica do beneficio para revisao de contribuicao e FAB e BS gravados
             invertido na HST
-------------------------------------------------------------------------------}
//Pendência   : 253577/17661  PPM 1019931
//Responsável : Fernando Xavier
//Data        : 02/09/2015
//Descrição   : Criação do Frame - Adequação Equacionamento
//------------------------------------------------------------------------------

unit UFrameBeneficioRevisar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, MskEdDlg, StdCtrls, Mask, Grids, Wwdbigrd, Wwdbgrid, Db, uCMMath,
  DBTables, Wwquery, Wwdatsrc, ExtCtrls, TREdit, UFuncoesUteis, UAdmPrev;

type
  TDadosTransfere = record
                      rVlrReserva : double;
                      rVlrReservaCota : double;
                      iTotBeneficiarios : integer;
                      sAnoMesAtual : string;
                    end;
  TFrameBeneficioRevisar = class(TFrame)
    dbCheckBeneficio: TDBCheckBox;
    qryFrameDadosBeneficio: TwwQuery;
    dsFrameDadosBeneficio: TwwDataSource;
    dbChkBeneficio: TDBText;
    QryUpdate: TwwQuery;
    qryAux: TwwQuery;
    updDadosBeneficoi: TUpdateSQL;
    qryDadosPessoaBeneficio: TwwQuery;
    pnlDados: TPanel;
    dbgrdDadosBeneficioFuncef: TwwDBGrid;
    dbgrdDadosBeneficioINSS: TwwDBGrid;
    GbLegenda: TGroupBox;
    lblanomesreemindiv: TLabel;
    DBText6: TDBText;
    lblOpcao1: TLabel;
    lblOpcao2: TLabel;
    lblOpcao3: TLabel;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText5: TDBText;
    GbReemindiv: TGroupBox;
    Label70: TLabel;
    edMesAno: TMaskEdit;
    chkmesreemindiv: TCheckBox;
    EdValorBase3: TcmMaskEditDlg;
    EdValorBase2: TcmMaskEditDlg;
    EdValorBase1: TcmMaskEditDlg;
    qryBenefbfciario: TwwQuery;
    qryDadosBeneficios: TwwQuery;
    procedure dbgrdDadosBeneficioFuncefFieldChanged(Sender: TObject;
      Field: TField);
    procedure dbgrdDadosBeneficioINSSFieldChanged(Sender: TObject;
      Field: TField);
    procedure qryFrameDadosBeneficioAfterOpen(DataSet: TDataSet);
    procedure EdValorBase1BtnClick(Sender: TObject);
    procedure EdValorBase1Change(Sender: TObject);
    procedure EdValorBase2BtnClick(Sender: TObject);
    procedure EdValorBase2Change(Sender: TObject);
    procedure EdValorBase3BtnClick(Sender: TObject);
    procedure EdValorBase3Change(Sender: TObject);
    procedure chkmesreemindivClick(Sender: TObject);
  private
    { Private declarations }
    fTotalPROCESSA: Integer;
    bTemBSFabParametrizado   : boolean;
    bTemDeficitParametrizado : boolean;
    bTemNovoCalculoPensao    : boolean;      //edilaine WO22176

    rOpcao,
    rOpcao1,
    rOpcao2,
    rOpcao3,
    rVlrTotal,
    rVlrAtual        : real;

    sIdSitPart,
    sIdSitFunc,
    sIdSitPlanoPrev,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes      : String;

    iIdCalculo    : longInt;

    function CalculaValorDeficit(dPercentual : double ) : double;
    function CalculaValorTotal : double;

    function CalculaOpcao(piIdRegraCalculo : longint;
                          sCampo, sTitulo : string) : double;
  public
    { Public declarations }

  end;


var
  FrameBeneficioRevisar : TFrameBeneficioRevisar;
  DadosFrame :  TDadosTransfere;

implementation

{$R *.DFM}


Uses UMensErro, Ubeneficio;


{ TFrameBeneficioRevisar }

procedure TFrameBeneficioRevisar.dbgrdDadosBeneficioFuncefFieldChanged(
  Sender: TObject; Field: TField);
var dRMI, dPecent, dValorTotal : double;
    recno, iContador : integer;
    sProcessa, sFildName : string;
    sPercentual : string;
    dPercPensao : double;     //edilaine WO22176
begin
  iContador := 0;
  // edilaine - SOL 253577-18149 / PPM 1318909 - inicio
  {//Renato Visoni Sol 96996 / Kintana 420711
  QryUpdate.Close;
  QryUpdate.SQL.Clear;
  QryUpdate.SQL.Add('SELECT * FROM CONTRIBPREVPARTP');
  QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
  QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
  QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
  QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
  QryUpdate.SQL.Add('AND IDCONTRIBUICAO IN (''259'',''500'',''633'')');

  QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
  QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
  QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
  QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;

  QryUpdate.Open;


  if QryUpdate.RecordCount = 1 then begin
    if (((UpperCase(Field.FieldName) = 'DATAINICIO') and (QryUpdate.FieldByName('DATAINICIO').AsDateTime <> qryFrameDadosBeneficio.FieldByName('DATAINICIO').AsDateTime))
      or ((UpperCase(Field.FieldName) = 'DATAINICIOFUND')))
      and (qryFrameDadosBeneficio.FieldByName('FLGREFERENCIA').AsString='0') then begin
      if (UpperCase(Field.FieldName) = 'DATAINICIO') then begin
        QryUpdate.Close;
        QryUpdate.SQL.Clear;
        QryUpdate.SQL.Add('UPDATE CONTRIBPREVPARTP SET DATAINICIO =:DATAINICIO');
        QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
        QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
        QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
        QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
        QryUpdate.SQL.Add('AND IDCONTRIBUICAO IN (''259'',''500'',''633'')');

        QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
        QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
        QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
        QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;
        QryUpdate.ParamByName('DATAINICIO').asDatetime   := qryFrameDadosBeneficio.FieldByName('DATAINICIO').asDateTime;
        QryUpdate.ExecSQL;
        QryUpdate.close; //SOL 144007/2802 Kintana 1003179
      end;

      QryUpdate.Close;
      QryUpdate.SQL.Clear;
      QryUpdate.SQL.Add('UPDATE  BENEFBFCIARIO SET');
      if (UpperCase(Field.FieldName) = 'DATAINICIO') then begin
        QryUpdate.SQL.Add('DATAINICIO =:DATAINICIO');
        QryUpdate.ParamByName('DATAINICIO').asDatetime     := qryFrameDadosBeneficio.FieldByName('DATAINICIO').asDateTime;
      end else begin
        QryUpdate.SQL.Add('DATAINICIOFUND=:DATAINICIOFUND');
        QryUpdate.ParamByName('DATAINICIOFUND').asDatetime := qryFrameDadosBeneficio.FieldByName('DATAINICIOFUND').asDateTime;
      end;
      QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
      QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
      QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
      QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
      QryUpdate.SQL.Add('AND IDBENEFICIO    =:IDBENEFICIO');

      QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
      QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
      QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
      QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;
      QryUpdate.ParamByName('IDBENEFICIO').AsString    := qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsString;
      QryUpdate.ExecSQL;
      QryUpdate.close; //SOL 144007/2802 Kintana 1003179
    end;
  end;
  //Renato Visoni Sol 96996 / Kintana 420711
  } // edilaine - SOL 253577-18149 / PPM 1318909 - fim

  // SOL 140042 Kintana 900220
  dbgrdDadosBeneficioFuncef.onFieldChanged := nil;
  if qryFrameDadosBeneficio.state in [dsinsert, dsedit] then
     qryFrameDadosBeneficio.post;

  if (Field.FieldName = 'PROCESSA') then
  begin
    if Field.AsInteger = 1 then
    begin
      fTotalPROCESSA := fTotalPROCESSA + 1;
      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('PROCESSA').AsFloat := 1;
      qryFrameDadosBeneficio.Post;
    end
    else
    begin
      fTotalPROCESSA := fTotalPROCESSA - 1;
      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('PROCESSA').AsFloat := 0;
      qryFrameDadosBeneficio.Post;
    end;

    if (dbgrdDadosBeneficioFuncef.DataSource.DataSet.FieldbyName('FONTEPAGADORA').AsInteger = 2) then
    begin
       lblanomesreemindiv.Visible    := (fTotalPROCESSA > 0) ;
       if chkmesreemindiv.Checked then
          GbReemindiv.Visible        := (fTotalPROCESSA > 0) ;
       chkmesreemindiv.Visible       := (fTotalPROCESSA > 0) ;
    end;
  end;
  fTotalPROCESSA := 0;

  if not(qryFrameDadosBeneficio.state in [dsinsert, dsedit]) then
     qryFrameDadosBeneficio.edit;

  // pega taxa
  if qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger <> qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger then
  begin
    dPecent := 0;
    if BuscaPercentualGrupoFamiliar(DadosFrame.sAnoMesAtual,
                                    qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsString,
                                    qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPLANOORIGEM').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                                    sPercentual) then
    begin
      if sPercentual <> '' then
         dPecent :=  StrToFloat(sPercentual);
    end;
  end
  else
    dPecent := 100;


  dbgrdDadosBeneficioFuncef.onFieldChanged := nil;

  // remove os readOnly para atribuir valor
  //edilaine WO22176 : inicio
  try
    if (bTemNovoCalculoPensao) then
    begin
      if ( (UpperCase(Field.FieldName) = 'PERC_PENSAO') or
           (UpperCase(Field.FieldName) = 'BSTITULAR') or
           (UpperCase(Field.FieldName) = 'FABTITULAR') ) then
      begin
        qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').readOnly  := false;
        qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').readOnly := false;
        qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').readOnly  := false;
        qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').readOnly := false;
        qryFrameDadosBeneficio.FieldByName('VALORTOTAL').readOnly  := false;
        qryFrameDadosBeneficio.FieldByName('VALORATUAL').readOnly  := false;
     end
     else
       exit;
    end
    //edilaine WO22176 : fim
    else
    begin
      if ( (UpperCase(Field.FieldName) = 'VALORTOTAL') or
           (UpperCase(Field.FieldName) = 'VLRBSTOTAL') or
           (UpperCase(Field.FieldName) = 'VLRFABTOTAL') ) then
      begin
        if bTemBSFabParametrizado then
        begin
          qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').readOnly  := false;
          qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').readOnly := false;
          qryFrameDadosBeneficio.FieldByName('VALORTOTAL').readOnly  := false;
        end;
        if bTemDeficitParametrizado then
           qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').readOnly := false;
        qryFrameDadosBeneficio.FieldByName('VALORATUAL').readOnly  := false;
      end;
    end;


    if qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger
    then begin
       if (UpperCase(Field.FieldName) = 'VALORTOTAL') and (not bTemBSFabParametrizado)
          and (qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat <> qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat)
       then begin
          qryFrameDadosBeneficio.Edit;
          qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
          qryFrameDadosBeneficio.Post;
       end;
    end
    else // SOL161842 inicio da atualização do campo valor atual para quando for pensionista
    begin
       if (UpperCase(Field.FieldName) = 'VALORTOTAL') and (not bTemBSFabParametrizado)
       then begin
          dValorTotal := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;

          qryFrameDadosBeneficio.Edit;
          qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);   // william moreira - SOL 268941 / PPM 1271559
          qryFrameDadosBeneficio.Post;
       end;
    end;

    //edilaine WO22176 : inicio
    if (bTemNovoCalculoPensao) then
    begin
      if (UpperCase(Field.FieldName) = 'PERC_PENSAO') or
         (UpperCase(Field.FieldName) = 'BSTITULAR')   or
         (UpperCase(Field.FieldName) = 'FABTITULAR')  then
      begin
        if (UpperCase(Field.FieldName) = 'PERC_PENSAO') then
        begin
          dPercPensao := CalculaPercPensao(qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger,
                                           qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                           qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                                           DadosFrame.sAnoMesAtual);

          if (qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').AsFloat <> qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').OldValue) and
             (qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').AsFloat > dPercPensao) then
          begin
            MsgDlg('Não foi possível mudar o percentual!'+char(10)+char(13)+
                   'Não há outro dependente elegível ao benefício.','Informação',mtInformation,[mbOk,mbHelp],0);
            qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').AsFloat := qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').OldValue;                   
            exit;
          end;
        end;

        dPercPensao := qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').AsFloat;
        dValorTotal := qryFrameDadosBeneficio.FieldByName('BSTITULAR').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat := RoundCm(dValorTotal * (dPercPensao / 100),2);
        qryFrameDadosBeneficio.Post;

        dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);
        qryFrameDadosBeneficio.Post;

        dValorTotal := qryFrameDadosBeneficio.FieldByName('FABTITULAR').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat := RoundCM(dValorTotal * (dPercPensao / 100),2);
        qryFrameDadosBeneficio.Post;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VLRTOTALTITULAR').AsFloat := dValorTotal + qryFrameDadosBeneficio.FieldByName('BSTITULAR').AsFloat;
        qryFrameDadosBeneficio.Post;


        dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);
        qryFrameDadosBeneficio.Post;
      end;

      dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat + qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat;

      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat := dValorTotal;
      qryFrameDadosBeneficio.Post;

      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);
      qryFrameDadosBeneficio.Post;
    end;
    //edilaine WO22176 : fim

    if (not bTemNovoCalculoPensao) and                                                                    //edilaine WO22176
       ((UpperCase(Field.FieldName) = 'VLRBSTOTAL') or (UpperCase(Field.FieldName) = 'VLRFABTOTAL')) then
    begin
      if (UpperCase(Field.FieldName) = 'VLRBSTOTAL')  then
      begin
        if (qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger)
           and (qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').AsFloat <> qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat)
        then begin
           qryFrameDadosBeneficio.Edit;
           qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').AsFloat := qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat;
           qryFrameDadosBeneficio.Post;
        end
        else if (qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger <> qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger) then
        begin
          dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat;

          qryFrameDadosBeneficio.Edit;
          qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);      // william moreira - SOL 268941 / PPM 1271559
          qryFrameDadosBeneficio.Post;
        end;
      end
      else
      begin
        if (qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger)
           and (qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').AsFloat <> qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat)
        then begin
           qryFrameDadosBeneficio.Edit;
           qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').AsFloat := qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat;
           qryFrameDadosBeneficio.Post;
        end
        else if (qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger <> qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger) then
        begin
          dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat;

          qryFrameDadosBeneficio.Edit;
          qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);     // william moreira - SOL 268941 / PPM 1271559
          qryFrameDadosBeneficio.Post;
        end;
      end;

      // alterar Valor Total e Atual
      if (bTemBSFabParametrizado) then
      begin
        //dValorTotal := CalculaValorTotal();
        dValorTotal := qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat + qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat := dValorTotal;
        qryFrameDadosBeneficio.Post;

        if qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger then
        begin
           qryFrameDadosBeneficio.Edit;
           qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
           qryFrameDadosBeneficio.Post;
        end
        else
        begin
           dValorTotal := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;

           qryFrameDadosBeneficio.Edit;
           qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := RoundCM((dValorTotal * (dPecent/100)),2);         // william moreira - SOL 268941 / PPM 1271559
           qryFrameDadosBeneficio.Post;
        end;
      end;
    end;

    // alterar Valor do Deficit
    if (bTemDeficitParametrizado) and
       ( (UpperCase(Field.FieldName) = 'VALORTOTAL') or
         (UpperCase(Field.FieldName) = 'VLRBSTOTAL') or
         (UpperCase(Field.FieldName) = 'VLRFABTOTAL') ) then
    begin
      dValorTotal := CalculaValorDeficit(dPecent);
      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').AsFloat := dValorTotal;
      qryFrameDadosBeneficio.Post;
    end;

    // volta os readOnly
    //edilaine WO22176 : inicio
    if (bTemNovoCalculoPensao) then
    begin
      qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').readOnly  := true;
      qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').readOnly := true;
      qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').readOnly  := true;
      qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').readOnly := true;
      qryFrameDadosBeneficio.FieldByName('VALORTOTAL').readOnly  := true;
      qryFrameDadosBeneficio.FieldByName('VALORATUAL').readOnly  := true;
    end
    else
    //edilaine WO22176 : fim
    begin
      if bTemBSFabParametrizado then
      begin
        qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').readOnly  := true;
        qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').readOnly := true;
        qryFrameDadosBeneficio.FieldByName('VALORTOTAL').readOnly  := true;
      end;
      if bTemDeficitParametrizado then
         qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').readOnly := true;
      qryFrameDadosBeneficio.FieldByName('VALORATUAL').readOnly  := true;
    end;

  finally
    dbgrdDadosBeneficioFuncef.onFieldChanged := dbgrdDadosBeneficioFuncefFieldChanged;   //SOL 162214 Kintana 1376847
  end;
end;

procedure TFrameBeneficioRevisar.dbgrdDadosBeneficioINSSFieldChanged(
  Sender: TObject; Field: TField);
var dRMI, dPecent, dValorTotal : double;
    recno, iContador : integer;
    sProcessa, sFildName : string;
    sPercentual : string;        // Peterson Victor - SOL 269621 / PPM
begin
  inherited;
  iContador := 0;

  // edilaine - SOL 253577-18149 / PPM 1318909 - inicio
  //Renato Visoni Sol 96996 / Kintana 420711
  {QryUpdate.Close;
  QryUpdate.SQL.Clear;
  QryUpdate.SQL.Add('SELECT * FROM CONTRIBPREVPARTP');
  QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
  QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
  QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
  QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
  QryUpdate.SQL.Add('AND IDCONTRIBUICAO IN (''259'',''500'',''633'')');

  QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
  QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
  QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
  QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;

  QryUpdate.Open;

  if QryUpdate.RecordCount = 1 then begin
    if (((UpperCase(Field.FieldName) = 'DATAINICIO') and (QryUpdate.FieldByName('DATAINICIO').AsDateTime <> qryFrameDadosBeneficio.FieldByName('DATAINICIO').AsDateTime))
      or ((UpperCase(Field.FieldName) = 'DATAINICIOFUND')))
      and (qryFrameDadosBeneficio.FieldByName('FLGREFERENCIA').AsString='0') then begin
      if (UpperCase(Field.FieldName) = 'DATAINICIO') then begin
        QryUpdate.Close;
        QryUpdate.SQL.Clear;
        QryUpdate.SQL.Add('UPDATE CONTRIBPREVPARTP SET DATAINICIO =:DATAINICIO');
        QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
        QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
        QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
        QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
        QryUpdate.SQL.Add('AND IDCONTRIBUICAO IN (''259'',''500'',''633'')');

        QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
        QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
        QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
        QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;
        QryUpdate.ParamByName('DATAINICIO').asDatetime   := qryFrameDadosBeneficio.FieldByName('DATAINICIO').asDateTime;
        QryUpdate.ExecSQL;
        QryUpdate.close; //SOL 144007/2802 Kintana 1003179
      end;

      QryUpdate.Close;
      QryUpdate.SQL.Clear;
      QryUpdate.SQL.Add('UPDATE  BENEFBFCIARIO SET');
      if (UpperCase(Field.FieldName) = 'DATAINICIO') then begin
        QryUpdate.SQL.Add('DATAINICIO =:DATAINICIO');
        QryUpdate.ParamByName('DATAINICIO').asDatetime     := qryFrameDadosBeneficio.FieldByName('DATAINICIO').asDateTime;
      end else begin
        QryUpdate.SQL.Add('DATAINICIOFUND=:DATAINICIOFUND');
        QryUpdate.ParamByName('DATAINICIOFUND').asDatetime := qryFrameDadosBeneficio.FieldByName('DATAINICIOFUND').asDateTime;
      end;
      QryUpdate.SQL.Add('WHERE IDPESSOA     =:IDPESSOA');
      QryUpdate.SQL.Add('AND IDPLANOPREV    =:IDPLANOPREV');
      QryUpdate.SQL.Add('AND IDPESSJUR      =:IDPESSJUR');
      QryUpdate.SQL.Add('AND SEQPROPOSTA    =:SEQPROPOSTA');
      QryUpdate.SQL.Add('AND IDBENEFICIO    =:IDBENEFICIO');

      QryUpdate.ParamByName('IDPESSOA').AsString       := qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString;
      QryUpdate.ParamByName('IDPLANOPREV').AsString    := qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString;
      QryUpdate.ParamByName('IDPESSJUR').AsString      := qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString;
      QryUpdate.ParamByName('SEQPROPOSTA').AsString    := qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsString;
      QryUpdate.ParamByName('IDBENEFICIO').AsString    := qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsString;
      QryUpdate.ExecSQL;
      QryUpdate.close; //SOL 144007/2802 Kintana 1003179
    end;
  end;
  //Renato Visoni Sol 96996 / Kintana 420711
  } // edilaine - SOL 253577-18149 / PPM 1318909 - fim


  // SOL 140042 Kintana 900220
  dbgrdDadosBeneficioINSS.onFieldChanged := nil;
  if qryFrameDadosBeneficio.state in [dsinsert, dsedit] then
     qryFrameDadosBeneficio.post;

  if (Field.FieldName = 'PROCESSA') then
  begin
    if Field.AsInteger = 1 then
    begin
      fTotalPROCESSA := fTotalPROCESSA + 1;
      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('PROCESSA').AsFloat := 1;
      qryFrameDadosBeneficio.Post;
    end
    else
    begin
      fTotalPROCESSA := fTotalPROCESSA - 1;
      qryFrameDadosBeneficio.Edit;
      qryFrameDadosBeneficio.FieldByName('PROCESSA').AsFloat := 0;
      qryFrameDadosBeneficio.Post;
    end;
    if (dbgrdDadosBeneficioINSS.DataSource.DataSet.FieldbyName('FONTEPAGADORA').AsInteger = 2) then
    begin
       lblanomesreemindiv.Visible    := (fTotalPROCESSA > 0) ;
       if chkmesreemindiv.Checked then
          GbReemindiv.Visible        := (fTotalPROCESSA > 0) ;
       chkmesreemindiv.Visible       := (fTotalPROCESSA > 0) ;
    end;
  end;
  fTotalPROCESSA := 0;

  if not(qryFrameDadosBeneficio.state in [dsinsert, dsedit]) then
     qryFrameDadosBeneficio.edit;

  // Peterson Victor - SOL 269621 / PPM
  // pega taxa
  if qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger <> qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger then
  begin
    dPecent := 0;
    if BuscaPercentualGrupoFamiliar(DadosFrame.sAnoMesAtual,
                                    qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsString,
                                    qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('IDPLANOORIGEM').AsInteger,
                                    qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                                    sPercentual) then
    begin
      if sPercentual <> '' then
         dPecent :=  StrToFloat(sPercentual);
    end;
  end
  else
    dPecent := 100;
  // Peterson Victor - SOL 269621 / PPM

  dbgrdDadosBeneficioINSS.onFieldChanged := dbgrdDadosBeneficioINSSFieldChanged;

  if qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger = qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger
  then begin
     if (UpperCase(Field.FieldName) = 'VALORTOTAL')
        and (qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat <> qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat)
     then begin
        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;
        qryFrameDadosBeneficio.Post;
     end;
  end
  else // SOL161842 inicio da atualização do campo valor atual para quando for pensionista
  begin
     if (UpperCase(Field.FieldName) = 'VALORTOTAL')
     then begin
        //dPecent     := 0;                                       // Peterson Victor - SOL 269621 / PPM - comentado inicio
        dValorTotal := 0;
        dbgrdDadosBeneficioINSS.onFieldChanged := nil;   // SOL 162214 Kintana 1376847

        // Peterson Victor - SOL 269621 / PPM - comentado inicio
        {qryAux.Close;
        qryAux.SQL.Clear;
        // Thiago Melo SOL 181974 Kintana 1689870 (14/06/2012)
        qryAux.SQL.Add(' SELECT BTT.PERCENTUAL '    +
                       ' FROM BFCIARIOTITPLAN BTT, BENEFBFCIARIO BFC ' +
                       '      WHERE  BFC.IDPESSOA = BTT.IDPESSOA ' +
                       '      AND    BFC.IDBENEFICIO = BTT.IDBENEFICIO ' +
                       '      AND    BTT.IDPESSJUR      =  '+ qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsString   +
                       '      AND    BTT.IDPESSOA       =  '+ qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsString     +
                       '      AND    BTT.IDBENEFICIO    =  '+ qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsString +
                       '      AND    BFC.NUMEROPROCESSO =  '+ qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsString +
                       '      AND    BTT.IDPLANOPREV    =  '+ qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString);
        // Thiago Melo SOL 181974 Kintana 1689870

        qryAux.Open;
        dPecent     := qryAux.FieldByName('PERCENTUAL').AsFloat;
        }// Peterson Victor - SOL 269621 / PPM - comentado fim

        dValorTotal := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;

        qryFrameDadosBeneficio.Edit;
        qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat := (dValorTotal * (dPecent/100));
        qryFrameDadosBeneficio.Post;
        dbgrdDadosBeneficioINSS.onFieldChanged := dbgrdDadosBeneficioINSSFieldChanged;   //SOL 162214 Kintana 1376847
     end;
  end; // SOL161842 final da atualização do campo valor atual para quando for pensionista

end;

procedure TFrameBeneficioRevisar.qryFrameDadosBeneficioAfterOpen(DataSet: TDataSet);
begin

   if (qryFrameDadosBeneficio.FieldByName('FONTEPAGADORA').AsInteger = 2) then
   begin
      bTemDeficitParametrizado := false;
      bTemBSFabParametrizado   := false;

      //dbgrdDadosBeneficioINSS.ColWidths[0]:=0;
      qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').Visible   := false;    //edilaine WO22176
      qryFrameDadosBeneficio.FieldByName('BSTITULAR').Visible     := false;    //edilaine WO22176
      qryFrameDadosBeneficio.FieldByName('FABTITULAR').Visible    := false;    //edilaine WO22176

      qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').Visible     := false;
      qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').Visible     := false;
      qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').Visible    := false;
      qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').Visible    := false;
      qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').Visible := false;

      dbgrdDadosBeneficioINSS.Visible   := true;
      dbgrdDadosBeneficioFuncef.Visible := false;

      dbgrdDadosBeneficioFuncef.OnFieldChanged := nil;
   end
   else
   begin
      //edilaine WO22176 : inicio
      //with twwquery.create(nil) do
      begin
         //DataBaseName := 'basedados';
         //close;
         //sql.clear;
         //sql.add('SELECT B.FLGAPRESENTABSFAB, B.FLGAPRESENTADEFICIT' + #13#10 +
         //        '  FROM BENEFPLANPREV B' + #13#10 +
         //        ' WHERE B.IDBENEFICIO = '+ qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsString + #13#10 +
         //        '   AND B.IDPLANOPREV = '+qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsString);
         //open;

         bTemDeficitParametrizado := (qryFrameDadosBeneficio.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);
         bTemBSFabParametrizado   := (qryFrameDadosBeneficio.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
         bTemNovoCalculoPensao    := (qryFrameDadosBeneficio.FieldByName('FLGNOVOCALCPENSAO').AsInteger = 1);

         qryFrameDadosBeneficio.FieldByName('PERC_PENSAO').Visible   := bTemNovoCalculoPensao;
         qryFrameDadosBeneficio.FieldByName('BSTITULAR').Visible     := bTemNovoCalculoPensao;
         qryFrameDadosBeneficio.FieldByName('FABTITULAR').Visible    := bTemNovoCalculoPensao;

         qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').Visible     := bTemBSFabParametrizado;   //(FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
         qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').Visible     := bTemBSFabParametrizado;   //(FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
         qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').Visible    := bTemBSFabParametrizado;   //(FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
         qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').Visible    := bTemBSFabParametrizado;   //(FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
         qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').Visible := bTemDeficitParametrizado; //(FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);

         // se estiver parametrizado só defícit, deixa habilitado
         qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').ReadOnly     := bTemNovoCalculoPensao;
         qryFrameDadosBeneficio.FieldByName('VLRFABTOTAL').ReadOnly    := bTemNovoCalculoPensao;

         qryFrameDadosBeneficio.FieldByName('VLRBSATUAL').ReadOnly     := bTemBSFabParametrizado;
         qryFrameDadosBeneficio.FieldByName('VLRFABATUAL').ReadOnly    := bTemBSFabParametrizado;
         qryFrameDadosBeneficio.FieldByName('VALORATUAL').ReadOnly     := true;
         qryFrameDadosBeneficio.FieldByName('VALORTOTAL').ReadOnly     := bTemBSFabParametrizado;
         qryFrameDadosBeneficio.FieldByName('VLRBASEDEFICIT').ReadOnly := bTemBSFabParametrizado or bTemDeficitParametrizado;

         //close;
      end;
      //edilaine WO22176 : fim

      dbgrdDadosBeneficioINSS.Visible   := false;
      dbgrdDadosBeneficioFuncef.Visible := true;

      dbgrdDadosBeneficioINSS.OnFieldChanged := nil;
   end;

   chkmesreemindiv.visible    := (qryFrameDadosBeneficio.FieldByName('FONTEPAGADORA').AsInteger = 2);
   lblanomesreemindiv.visible := (qryFrameDadosBeneficio.FieldByName('FONTEPAGADORA').AsInteger = 2);

   EdValorBase1.Text := qryFrameDadosBeneficio.FieldByName('VALORBASE1').AsString;
   EdValorBase2.Text := qryFrameDadosBeneficio.FieldByName('VALORBASE2').AsString;
   EdValorBase3.Text := qryFrameDadosBeneficio.FieldByName('VALORBASE3').AsString;

   EdValorBase1.Visible := True;
   EdValorBase2.Visible := True;
   EdValorBase2.Visible := True;

   If (qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP1').AsInteger = 0) And (Trim(EdValorBase1.Text) = '' ) then
   Begin
     lblOpcao1.Visible    := False;
     EdValorBase1.Visible := False;
   End;

   If (qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP2').AsInteger = 0) And (Trim(EdValorBase2.Text) = '' ) then
   Begin
     lblOpcao2.Visible    := False;
     EdValorBase2.Visible := False;
   End;

   If (qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP3').AsInteger = 0) And (Trim(EdValorBase3.Text) = '' ) then
   Begin
     lblOpcao3.Visible    := False;
     EdValorBase3.Visible := False;
   End;

end;

function TFrameBeneficioRevisar.CalculaOpcao(piIdRegraCalculo: Integer;
                                         sCampo, sTitulo: string): double;
var
  rOpcao, rOpcao1, rOpcao2, rOpcao3 : double;
  bErro  : boolean;
  sMsgErro : string;
begin
  inherited;

  rOpcao := 0;
  Result := 0;

  If piIdRegraCalculo <= 0 Then Exit;


  // Executar regra de calculo da opcao
  if Trim(EdValorBase1.Text) = '' then
    rOpcao1 := 0
  else
    rOpcao1 := StrToFloat(EdValorBase1.Text);

  if Trim(EdValorBase2.Text) = ''  then
    rOpcao2 := 0
  else
    rOpcao2 := StrToFloat(EdValorBase2.Text);

  if Trim(EdValorBase3.Text) = '' then
    rOpcao3 := 0
  else
    rOpcao3 := StrToFloat(EdValorBase3.Text);


  //frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Benefício - Nº '+IntToStr(piIdRegraCalculo));

  try
     rOpcao := ExecutaRegraCalculoOpcaoBenef(qryAux,
                         piIdRegraCalculo,
                         piIdRegraCalculo,
                         qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,
                         qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,
                         qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                         qryFrameDadosBeneficio.FieldByName('SEQPROPOSTA').AsInteger,
                         qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,
                         qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger,
                         StrToInt(sIdSitPart),
                         StrToInt(sIdSitFunc),
                         StrToInt(sIdSitPlanoPrev),
                         rOpcao1, rOpcao2, rOpcao3,
                         FormatDateTime('dd/mm/yyyy', Date), 
                         qryFrameDadosBeneficio.FieldByName('DATAINICIO').AsString,
                         qryFrameDadosBeneficio.FieldByName('DATAINICIOINSS').AsString,
                         qryFrameDadosBeneficio.FieldByName('VLRINFINSS').AsString,
                         qryFrameDadosBeneficio.FieldByName('DATAREQUERIMENTO').AsString,
                         qryFrameDadosBeneficio.FieldByName('VLRCALCINSS').AsString,
                         '0',
                         '0',
                         '0',
                         bErro,
                         sMsgErro,
                         iIdCalculo,
                         '1',
                         '1',
                         sIdSitPartAntes,
                         sIdSitPlanAntes,
                         sIdSitFuncAntes, 

                         sIdSitPart,      
                         sIdSitFunc,
                         sIdSitPlanoPrev, 
                         qryFrameDadosBeneficio.FieldByName('VALORSRB').AsString);
  except

    Raise;
  end;

  qryAux.Close;

  if bErro then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    qryAux.Close;
    qryAux.Sql.Clear;
    Exit;
  end else
    Result := rOpcao;
end;

procedure TFrameBeneficioRevisar.EdValorBase1BtnClick(Sender: TObject);
begin
   qryDadosPessoaBeneficio.close;
   qryDadosPessoaBeneficio.ParamByName('IDPESSJUR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPLANOPREV').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPESSOA').AsInteger       :=  qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDBENEFICIO').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('NUMEROPROCESSO').AsInteger :=  qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDTITULAR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger;
   qryDadosPessoaBeneficio.open;

   sIdSitPart        := qryDadosPessoaBeneficio.FieldByName('IDSITPART').AsString;
   sIdSitFunc        := qryDadosPessoaBeneficio.FieldByName('IDSITFUNC').AsString;
   sIdSitPlanoPrev   := qryDadosPessoaBeneficio.FieldByName('IDSITPLANOPREV').AsString;
   //sIdSitPartAntes   := qryDadosPessoaBeneficio.FieldByName('NUMEROPROCESSO').AsString;
   //sIdSitPlanAntes   := qryDadosPessoaBeneficio.FieldByName('NUMEROPROCESSO').AsString;
   //sIdSitFuncAntes   := qryDadosPessoaBeneficio.FieldByName('NUMEROPROCESSO').AsString;

   { Executar regra de calculo da opcao }
   if (qryFrameDadosBeneficio.IsEmpty) or(Trim(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP1').AsString) = '')
   then Exit;
   rOpcao := CalculaOpcao(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP1').AsInteger,
                          'VALORBASE1',
                          qryFrameDadosBeneficio.FieldByName('NOMEVALORBASE1').AsString);
   EdValorBase1.Text  := FloatToStr(rOpcao);
end;

procedure TFrameBeneficioRevisar.EdValorBase1Change(Sender: TObject);
begin
  qryFrameDadosBeneficio.Edit;
  qryFrameDadosBeneficio.FieldByName('VALORBASE1').AsString := EdValorBase1.Text;
end;

procedure TFrameBeneficioRevisar.EdValorBase2BtnClick(Sender: TObject);
begin
   qryDadosPessoaBeneficio.close;
   qryDadosPessoaBeneficio.ParamByName('IDPESSJUR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPLANOPREV').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPESSOA').AsInteger       :=  qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDBENEFICIO').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('NUMEROPROCESSO').AsInteger :=  qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDTITULAR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger;
   qryDadosPessoaBeneficio.open;

   sIdSitPart        := qryDadosPessoaBeneficio.FieldByName('IDSITPART').AsString;
   sIdSitFunc        := qryDadosPessoaBeneficio.FieldByName('IDSITFUNC').AsString;
   sIdSitPlanoPrev   := qryDadosPessoaBeneficio.FieldByName('IDSITPLANOPREV').AsString;
   { Executar regra de calculo da opcao }
   if (qryFrameDadosBeneficio.IsEmpty) or(Trim(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP2').AsString) = '')
   then Exit;
   rOpcao := CalculaOpcao(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP2').AsInteger,
                          'VALORBASE2',
                          qryFrameDadosBeneficio.FieldByName('NOMEVALORBASE2').AsString);
   EdValorBase2.Text  := FloatToStr(rOpcao);
end;

procedure TFrameBeneficioRevisar.EdValorBase2Change(Sender: TObject);
begin
   qryFrameDadosBeneficio.Edit;
   qryFrameDadosBeneficio.FieldByName('VALORBASE2').AsString := EdValorBase2.Text;
end;

procedure TFrameBeneficioRevisar.EdValorBase3BtnClick(Sender: TObject);
begin
   qryDadosPessoaBeneficio.close;
   qryDadosPessoaBeneficio.ParamByName('IDPESSJUR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPLANOPREV').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDPESSOA').AsInteger       :=  qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDBENEFICIO').AsInteger    :=  qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('NUMEROPROCESSO').AsInteger :=  qryFrameDadosBeneficio.FieldByName('NUMEROPROCESSO').AsInteger;
   qryDadosPessoaBeneficio.ParamByName('IDTITULAR').AsInteger      :=  qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger;
   qryDadosPessoaBeneficio.open;

   sIdSitPart        := qryDadosPessoaBeneficio.FieldByName('IDSITPART').AsString;
   sIdSitFunc        := qryDadosPessoaBeneficio.FieldByName('IDSITFUNC').AsString;
   sIdSitPlanoPrev   := qryDadosPessoaBeneficio.FieldByName('IDSITPLANOPREV').AsString;
   
   { Executar regra de calculo da opcao }
   if (qryFrameDadosBeneficio.IsEmpty) or(Trim(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP3').AsString) = '')
   then Exit;
   rOpcao := CalculaOpcao(qryFrameDadosBeneficio.FieldByName('IDREGRACALCOP3').AsInteger,
                          'VALORBASE3',
                          qryFrameDadosBeneficio.FieldByName('NOMEVALORBASE3').AsString);
   EdValorBase3.Text  := FloatToStr(rOpcao);
end;

procedure TFrameBeneficioRevisar.EdValorBase3Change(Sender: TObject);
begin
   qryFrameDadosBeneficio.Edit;
   qryFrameDadosBeneficio.FieldByName('VALORBASE3').AsString := EdValorBase3.Text;
end;

procedure TFrameBeneficioRevisar.chkmesreemindivClick(Sender: TObject);
begin
   GbReemindiv.Visible      := (chkmesreemindiv.Checked);
end;



function TFrameBeneficioRevisar.CalculaValorDeficit(dPercentual : double ) : double;
var
  rVlrBaseDef    : double;
  bErro          : boolean;
  sMsgErro       : string;
  iIdCalculoAnt  : longint;
  sSQLBenefAssoc : string;
  sDataRef       : string;
begin
  if qryFrameDadosBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger <= 0 then
     Exit;

  // Executar regra de calculo do beneficio
  try
     sSQLBenefAssoc := MontaSQLBenefAssoc(qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger);

     rVlrBaseDef    := 0;
     iIdCalculoAnt  := iIdCalculo;

     if (StrToInt(Copy(qryFrameDadosBeneficio.FieldByName('DATAINICIO').AsString,1,2)) >= 29) and
        (StrToInt(Copy(DadosFrame.sAnoMesAtual,6,2)) = 2)
     then sDataRef := '28/'+copy(DadosFrame.sAnoMesAtual,6,2) + '/'+ copy(DadosFrame.sAnoMesAtual,1,4)
     else sDataRef := copy(qryFrameDadosBeneficio.FieldByName('DATAINICIO').AsString,1,2)+ '/' + copy(DadosFrame.sAnoMesAtual,6,2) + '/' + copy(DadosFrame.sAnoMesAtual,1,4);

     If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0) Then Begin
       sDataRef := '30'+Copy(sDataRef,3,9)
     End;


     rVlrBaseDef := ExecutaRegraCalculoDeficit(qryAux,
                                               qryFrameDadosBeneficio.FieldByName('IDREGRACALCBASEDEFICIT').AsInteger,
                                               qryFrameDadosBeneficio.FieldByName('IDPLANOPREV').AsInteger,    // iIdPlanoPrev,
                                               qryFrameDadosBeneficio.FieldByName('IDPESSJUR').AsInteger,      // iIdPessJur,
                                               qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,       // iIdPessoa,
                                               qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger,      // iIdTitular,
                                               qryFrameDadosBeneficio.FieldByName('IDBENEFICIO').AsInteger,    // IdBeneficio
                                               bErro,
                                               sMsgErro,
                                               iIdCalculo,
                                               qryFrameDadosBeneficio.FieldByName('VALORBASE1').AsFloat,       // rOpcao1,
                                               qryFrameDadosBeneficio.FieldByName('VALORBASE3').AsFloat,       // rOpcao1,
                                               sSQLBenefAssoc,
                                               qryFrameDadosBeneficio.FieldByName('VLRBSTOTAL').AsFloat,
                                               qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat,
                                               qryFrameDadosBeneficio.FieldByName('VALORATUAL').AsFloat,
                                               qryFrameDadosBeneficio.FieldByName('VLRINFINSS').AsFloat,
                                               FloatToStr(dPercentual),
                                               qryFrameDadosBeneficio.FieldByName('IDSITPLANOPREV').AsInteger,
                                               sDataRef,
                                               qryFrameDadosBeneficio.FieldByName('DATAINICIOFUND').AsString,
                                               qryFrameDadosBeneficio.FieldByName('IDPLANPREVCONTAB').AsInteger
                                              );

  except
  end;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    Exit;
  end;

  if iIdCalculo = 0 then
     iIdCalculo := iIdCalculoAnt;

  Result := rVlrBaseDef;

end;

function TFrameBeneficioRevisar.CalculaValorTotal: double;
var
  rValorTotal      : double;
  sValorBase1Ant   : string;
  sValorBase2Ant   : string;
  sValorBase3Ant   : string;
  sDataInicioAnt   : string;
  sValorAnt        : string;
  bErro            : boolean;
  sMsgErro         : string;
  iIdCalculo       : integer;
  sDataRef         : string;
  rVlrBS, rVlrFAB  : double;
begin


  if qryFrameDadosBeneficio.FieldbyName('FONTEPAGADORA').AsInteger = 1 then
  begin
    rVlrBS  := qryFrameDadosBeneficio.FieldbyName('VLRBSTOTAL').AsCurrency;
    rVlrFAB := qryFrameDadosBeneficio.FieldbyName('VLRFABTOTAL').AsCurrency;
  end
  else
  begin
    rVlrBS  := 0;
    rVlrFAB := 0;
  end;


  if qryFrameDadosBeneficio.FieldByName('IDTITULAR').AsInteger = qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger then
  begin
    rValorTotal := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsCurrency;
    rValorTotal := ExecutaRegraCalculoBeneficio( qryAux,
                                                 qryFrameDadosBeneficio.FieldByName('IDREGRACALCULO').AsInteger,
                                                 qryFrameDadosBeneficio.FieldByName('IDREGRAPAGAMENTO').AsInteger,
                                                 qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                                 qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                 qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                                 qryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger,
                                                 qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                                 qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                                 qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                                 qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                                 qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                                 '',
                                                 qryBenefBfciario.FieldByName('DTEVENTO').AsString,
                                                 qryBenefBfciario.FieldByName('DATAINICIOFUND').AsString,
                                                 qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString,
                                                 qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                                 qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString,
                                                 qryFrameDadosBeneficio.FieldByName('VLRINFINSS').AsString,
                                                 qryFrameDadosBeneficio.FieldByName('VLRCALCINSS').AsString,
                                                 FloatToStr(DadosFrame.rVlrReserva),   // VALORRESERVA
                                                 False,
                                                 0,
                                                 sDataInicioAnt,
                                                 sValorAnt,
                                                 sValorBase1Ant,
                                                 sValorBase2Ant,
                                                 sValorBase3Ant,
                                                 bErro,
                                                 sMsgErro,
                                                 iIdCalculo,
                                                 0,
                                                 qryBenefBfciario.FieldByName('VALORSRB').AsFloat,
                                                 qryBenefBfciario.FieldByName('IDSITPART').AsString,
                                                 qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString,
                                                 qryBenefBfciario.FieldByName('IDSITFUNC').AsString,
                                                 qryBenefBfciario.FieldByName('IDSITPART').AsString,
                                                 qryBenefBfciario.FieldByName('IDSITPLANOPREV').AsString,
                                                 qryBenefBfciario.FieldByName('IDSITFUNC').AsString,
                                                 '',
                                                 qryBenefBfciario.FieldByName('FLGPROVISORIO').AsInteger,
                                                 qryBenefBfciario.FieldByName('PRAZOPROVISORIO').AsInteger,
                                                 qryBenefBfciario.FieldByName('PERCPROVISORIO').AsFloat,
                                                 6,
                                                 rVlrFAB,
                                                 rVlrBS,
                                                 rValorTotal
                                               );
  end
  else
  begin

    if (StrToInt(Copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,1,2)) >= 29) and
       (StrToInt(Copy(DadosFrame.sAnoMesAtual,6,2)) = 2)
    then sDataRef := '28/'+copy(DadosFrame.sAnoMesAtual,6,2) + '/'+ copy(DadosFrame.sAnoMesAtual,1,4)
    else sDataRef := copy(qryBenefBfciario.FieldByName('DATAINICIO').AsString,1,2)+ '/' + copy(DadosFrame.sAnoMesAtual,6,2) + '/' + copy(DadosFrame.sAnoMesAtual,1,4);

    If (Copy(sDataRef,1,2) = '31') And (Pos(Copy(sDataRef,4,2), '04060911') <> 0) Then Begin
       sDataRef := '30'+Copy(sDataRef,3,9)
    End;

    rValorTotal := qryFrameDadosBeneficio.FieldByName('VALORTOTAL').AsFloat;

    rValorTotal := ExecutaRegraCalculoBeneficioBfciario( qryAux,
                                              qryBenefBfciario.FieldByName('IDREGRACALCULO').AsInteger,
                                              -1,
                                              qryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                              qryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                              qryBenefBfciario.FieldByName('IDTITULAR').AsInteger,
                                              1,
                                              qryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger,
                                              qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger,
                                              DadosFrame.iTotBeneficiarios,
                                              qryBenefBfciario.FieldByName('VALORBASE1').AsFloat,
                                              qryBenefBfciario.FieldByName('VALORBASE2').AsFloat,
                                              qryBenefBfciario.FieldByName('VALORBASE3').AsFloat,
                                              '',
                                              sDataRef,
                                              qryBenefBfciario.FieldByName('DATAINICIO').AsString,
                                              qryBenefBfciario.FieldByName('DATAINICIOINSS').AsString,
                                              OraNumero( FloatToStr(rValorTotal) ),

                                              qryFrameDadosBeneficio.FieldByName('VLRINFINSS').AsString,
                                              qryFrameDadosBeneficio.FieldByName('VLRCALCINSS').AsString,

                                              '0',
                                              bErro,
                                              sMsgErro,
                                              iIdCalculo,
                                              qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,

                                              qryBenefBfciario.FieldByName('IDDEPENDENCIA').AsString,
                                              qryBenefBfciario.FieldByName('PERCENTUAL').AsString,
                                              0,
                                              qryBenefBfciario.FieldByName('DIBBENEFANT').AsString,
                                              qryBenefBfciario.FieldByName('VALORBENEFANT').AsString,
                                              DadosFrame.sAnoMesAtual,
                                              qryFrameDadosBeneficio.FieldByName('IDPESSOA').AsInteger,
                                              qryBenefBfciario.FieldByName('FLGPROVISORIO').AsInteger,
                                              qryBenefBfciario.FieldByName('PRAZOPROVISORIO').AsInteger,
                                              qryBenefBfciario.FieldByName('PERCPROVISORIO').AsFloat,
                                              0,
                                              qryBenefBfciario.FieldByName('DATAREQUERIMENTO').AsString,
                                              6,       // Origem 6, Revisão de Benenficio
                                              rVlrFAB,
                                              rVlrBS
                                              );

  end;

  Result := rValorTotal;

end;





end.

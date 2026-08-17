unit FMudaStatusMT;


{ Alterações: 
--------------------------------------------------------------------------------------------------
N. Sig..........: 96817/96822
Data............: 18/03/2020
Responsável.....: Ewerton Beltramini
Descrição.......: Acrescentado o campo de data de lançamento.
--------------------------------------------------------------------------------------------------
Data        : 27/07/2009
SOL_Kintana : 121805_590324
Autor       : Cássio Camargo
Descrição   : Inclusão da opção "Não Identificado" e atribuição da Data de Lançamento da tela
              de Movimento Financeiro para a tela de Alteração de Status.
----------------------------------------------------------------------------------------------------
Rotina    : Permitir a alteração na Data de Disponibilidade
Data      : 28/08/2003
Autor     : Fabio Fagundes
Descrição : Incluido o campo dbeDataDisponib para Gravação
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlMovimFinanc, uCmSqlParams,
  DBTables;

type
  TfrmMudaStatusMT = class(TfrmSairAjuda)
    gbData: TGroupBox;
    dbedDataConcilia: TCMDateTimePicker;
    bbtnConfirma: TBitBtn;
    rgStatus: TRadioGroup;
    GroupBox1: TGroupBox;
    dbeDataDisponib: TCMDateTimePicker;
    GroupBox2: TGroupBox;            //Ewerton Beltramini - 18/03/2020 - SIG ...
    dbeDataLanc: TCMDateTimePicker;
    qryAux: TQuery;  //Ewerton Beltramini - 18/03/2020 - SIG ...

    procedure bbtnConfirmaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);


  private

  public

     sStatus, sIdModulo : String;
     bDataContabilFechada : Boolean;
     Function VerificaFechamento(DataFechamento: TDateTime; IdModulo : String): Boolean;

  end;



var
  frmMudaStatusMT: TfrmMudaStatusMT;



implementation
{$R *.DFM}
uses
  uMensErro, USistema, FMovimFinancMT;



procedure TfrmMudaStatusMT.FormCreate(Sender: TObject);
begin
   inherited;
   sStatus:='N';
end;   


procedure TfrmMudaStatusMT.rgStatusClick(Sender: TObject);
begin
   case rgStatus.ItemIndex of
      0: sStatus:='N';
      1: sStatus:='X';
      //Cássio - SOL Nº121805 KINTANA Nº 590324 - Início
      2: sStatus:='I';
      3: sStatus:='C';
      //Cássio - SOL Nº121805 KINTANA Nº 590324 - Fim
   end;
   dbedDataConcilia.Enabled:=(rgStatus.ItemIndex=1);
   if (dbedDataConcilia.Enabled) then
      dbedDataConcilia.Date:=Date
   else
      dbedDataConcilia.ClearDateTime;
end;

//Ewerton Beltramini - SIG 96817/96822 - 19/03/2020 - Inicio...
Function TfrmMudaStatusMT.VerificaFechamento(DataFechamento: TDateTime; IdModulo : String): Boolean;
Begin
   //Validando se a data do lancamento pode ser alterada ou não...
   //select PACDATABLOQ from PARAMCONTAB;
   QryAux.Close;
   QryAux.sql.clear;
   QryAux.sql.add('SELECT MAX(PACDATABLOQ) AS PACDATABLOQ FROM PARAMCONTAB');
   QryAux.open;

   if (QryAux.FieldByName('PACDATABLOQ').AsDatetime > DataFechamento) then
       bDataContabilFechada := True;

   //só deverá ser conferida se o módulo de origem do lançamento for o Folha de Benefícios select DATABLOQUEIO from BLOQUEIOFOLHA;
   if IdModulo = '18' then// folha de Beneficio...
   begin
         QryAux.Close;
         QryAux.sql.clear;
         QryAux.sql.Add('SELECT DATABLOQUEIO, NOMEUSUARIO FROM BLOQUEIOFOLHA');
         QryAux.sql.Add('WHERE NOMEUSUARIO = ' + QuotedStr(Sistema.NomeUsuario));
         QryAux.open;

         if (QryAux.FieldByName('DATABLOQUEIO').AsDatetime > DataFechamento) then
             bDataContabilFechada := True;
   end;

   //--select PERDATINI, PERDATFIM from PERIODO;
   QryAux.Close;
   QryAux.sql.clear;
   QryAux.sql.Add('SELECT PEREXERCICIO, PERDATINI, PERDATFIM, PERBLOQUE FROM PERIODO');
   QryAux.sql.Add(' where PERDATINI >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',DataFechamento)));
   QryAux.sql.Add('   and PERDATFIM <= ' + QuotedStr(FormatDateTime('dd/mm/yyyy',DataFechamento)));
   QryAux.open;

   if (QryAux.FieldByName('PERBLOQUE').AsString = 'S' ) then
      bDataContabilFechada := True;

   //--para os módulos Controle Financeiro e o de origem do lançamento -- select IDMODULO, DATABLOQUEIO from DIASBLOQMOD --select * from MODULO order by IDMODULO
   if ((IdModulo = '3') or (IdModulo = '4') or (IdModulo = '9')) then
   begin

        QryAux.Close;
        QryAux.sql.clear;
        QryAux.sql.Add(' SELECT P.PACDATABLOQ AS BLOQUEIO_CONTABIL, ');
        QryAux.sql.Add('        PD.PERDATINI,    ');
        QryAux.sql.Add('        PD.PERDATFIM,    ');
        QryAux.sql.Add('        PD.PERBLOQUE,    ');
        QryAux.sql.Add('        D1.DATABLOQUEIO AS BLOQUEIO_MODULO_CFINAN,  ');
        QryAux.sql.Add('        D2.DATABLOQUEIO AS BLOQUEIO_MODULO_RECEBER, ');
        QryAux.sql.Add('        D3.DATABLOQUEIO AS BLOQUEIO_MODULO_PAGAR    ');

        QryAux.sql.Add(' FROM CM.PARAMCONTAB P, ');
        QryAux.sql.Add('      CM.PERIODO PD, ');
        QryAux.sql.Add('      CM.DIASBLOQMOD D1, ');
        QryAux.sql.Add('      CM.MODULO M1, ');
        QryAux.sql.Add('      CM.DIASBLOQMOD D2, ');
        QryAux.sql.Add('      CM.MODULO M2, ');
        QryAux.sql.Add('      CM.DIASBLOQMOD D3, ');
        QryAux.sql.Add('      CM.MODULO M3 ');

        QryAux.sql.Add(' WHERE PD.PEREXERCICIO = ' + QuotedStr(FormatDateTime('yyyy',DataFechamento)));
        QryAux.sql.Add('   AND PD.PERNUMERO = ' + QuotedStr(FormatDateTime('mm',DataFechamento)));

        QryAux.sql.Add('   AND M1.IDMODULO IN (9) ');
        QryAux.sql.Add('   AND D1.IDMODULO = M1.IDMODULO ');
        QryAux.sql.Add('   AND M2.IDMODULO IN (4) ');
        QryAux.sql.Add('   AND D2.IDMODULO = M2.IDMODULO ');
        QryAux.sql.Add('   AND M3.IDMODULO IN (3) ');
        QryAux.sql.Add('   AND D3.IDMODULO = M3.IDMODULO ');

        QryAux.sql.Add(' GROUP BY P.PACDATABLOQ, ');
        QryAux.sql.Add('       D1.DATABLOQUEIO, ');
        QryAux.sql.Add('       D2.DATABLOQUEIO, ');
        QryAux.sql.Add('       D3.DATABLOQUEIO, ');
        QryAux.sql.Add('       PD.PERDATINI,');
        QryAux.sql.Add('       PD.PERDATFIM,');
        QryAux.sql.Add('       PD.PERBLOQUE');
        QryAux.open;


       if ( DataFechamento <= QryAux.FieldByName('BLOQUEIO_CONTABIL').AsDateTime) or
          ((DataFechamento >= QryAux.FieldByName('PERDATINI').AsDateTime) and (DataFechamento <= QryAux.FieldByName('PERDATFIM').AsDateTime) and (QryAux.FieldByName('PERBLOQUE').AsString  = 'S')) or
          ((DataFechamento <= QryAux.FieldByName('BLOQUEIO_MODULO_CFINAN').AsDateTime) and  (IdModulo = '9')) or
          ((DataFechamento <= QryAux.FieldByName('BLOQUEIO_MODULO_RECEBER').AsDateTime) and (IdModulo = '4')) or
          ((DataFechamento <= QryAux.FieldByName('BLOQUEIO_MODULO_PAGAR').AsDateTime) and (IdModulo = '3')) then
       begin
            bDataContabilFechada := True;
       end;
   end;

   Result := bDataContabilFechada;

End;
//Ewerton Beltramini - SIG 96817/96822 - 19/03/2020 - Fim.

procedure TfrmMudaStatusMT.bbtnConfirmaClick(Sender: TObject);
begin
   if (rgStatus.ItemIndex=1) and (dbedDataConcilia.Text='') then
   begin
       MsgDlg('Obrigatório preencher a data que este lançamento bateu no Banco',
              'Erro',mtError,[mbOk],0);
       dbedDataConcilia.SetFocus;
       ModalResult:=mrNone;
       Abort;
   end;

   //Ewerton Beltramini - SIG 96817/96822 - 19/03/2020 - Inicio...
   if ((VerificaFechamento(dbeDataLanc.date, sIdModulo)) and (dbeDataLanc.ReadOnly = False)) then
      dbeDataLanc.Date := 0;

   if bDataContabilFechada then
      MsgDlg('Não é permitido alterar a Data de Lançamento para períodos Bloqueados.' + #13 + 'A Data de Lançamento não será alterada!', 'Aviso',mtwarning,[mbOk],0);
   //Ewerton Beltramini - SIG 96817/96822 - 19/03/2020 - Fim.

   ModalResult:=mrOk;

end;

end.

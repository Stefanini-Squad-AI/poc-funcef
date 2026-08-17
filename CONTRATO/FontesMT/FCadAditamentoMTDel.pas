{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------
-------------------------------------------------------------------------------------
N.WO............: WO28914
Data............: 11/03/2026                    
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para melhorar e corrigir a exclusão de um aditamento que
                  não estava acontecendo.
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para atender a nova forma de indisponibilizar tudo pra tras
                  quando do lançamento de um aditamento com reinicio de parcelas.
-------------------------------------------------------------------------------------
N.WO............: WO28721
Data............: 10/12/2025
Responsável.....: Luis Ferrari
Descrição.......: Ajuste na query QryDadosAditamento para Oracle.

--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 09/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Ajustando/corrigindo falha que não estava incluindo o
                  IDADITAMENTO na seleção das parcelas medidas incluindo
                  rotinas de try/commit/rollback na exclusão.
--------------------------------------------------------------------------------
N. SIG..........: 121740
Data............: 16/12/2021
Responsável.....: Everson Cunha
Descrição.......: Aumentar o tamanho do campo "Descrição do Aditamento"
--------------------------------------------------------------------------------
Nº SIG......: 114663
Data........: 06/04/2021
Responsável.: Ewerton Beltramini
Descrição...: Inclusão de filtro em sql de exclusão de aditamentos.
--------------------------------------------------------------------------------
Nº SIG......: 111798
Data........: 23/03/2021
Responsável.: Everson Cunha
Descrição...: Criado o campo "Valor Aditamento"
--------------------------------------------------------------------------------
N. SIG..........: 88476
Data............: 11/11/2020
Responsável.....: Ewerton Beltramini
Descrição.......: Criação de novo formulario.  (frmCadAditamentoMTDel)
--------------------------------------------------------------------------------}

unit FCadAditamentoMTDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, DBCtrls, Mask,
  wwdbdatetimepicker, CMDateTimePicker, DBTables, Wwquery, Grids, DBGrids, uCtrlAditamento,
  TREdit;

type
  TfrmCadAditamentoMTDel = class(TfrmOkCancelar)
    cdsAditamento: TCMClientDataSet;
    dsAditamento: TDataSource;
    cdsCtrlParcelaMedicao: TCMClientDataSet;
    cdsServProdXItemContr: TCMClientDataSet;
    pnlTopo: TPanel;
    QryDadosAditamento: TwwQuery;
    QryAux: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    DscDadosAditamento: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    QryDadosAditamentoNOMECONTRATO: TStringField;
    QryDadosAditamentoUNIDNEGOC: TFloatField;
    QryDadosAditamentoIDOBJETO: TFloatField;
    QryDadosAditamentoNOMEOBJETO: TStringField;
    QryDadosAditamentoIDITEM: TFloatField;
    QryDadosAditamentoNOME_ITEM: TStringField;
    QryDadosAditamentoIDPARCMEDICAO: TFloatField;
    QryDadosAditamentoIDMEDICAO: TFloatField;
    QryDadosAditamentoPARCELANUM: TFloatField;
    QryDadosAditamentoVENCIMENTO: TDateTimeField;
    QryDadosAditamentoFLGPARCELAMEDIDA: TFloatField;
    QryDadosAditamentoIDADITAMENTO: TFloatField;
    QryDadosAditamentoTRGDTINCLUSAO: TDateTimeField;
    QryDadosAditamentoTRGUSERINCLUSAO: TStringField;
    QryDadosAditamentoTRGDTALTERACAO: TDateTimeField;
    QryDadosAditamentoTRGUSERALTERACAO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    QryDadosAditamentoIDCONTRATO: TFloatField;
    Label2: TLabel;
    dbtpDataAssinatura: TCMDateTimePicker;
    Label3: TLabel;
    dbeCodAditamento: TDBEdit;
    grbTipo: TGroupBox;
    lblTipo: TLabel;
    rbAditamento: TRadioButton;
    rbOutros: TRadioButton;
    chkReqReinicioParc: TCheckBox;
    dbmemDescricao: TDBMemo;
    Label4: TLabel;
    QryAuxLog: TwwQuery;
    QryAuxLogDTANTERIOR: TDateTimeField;
    edtValorAditado: TDBRealEdit;
    lblValorAditamento: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCtrlAditamento : TCtrlAditamento; // Felipe A. Santos SOL 217597/17169 PPM 772732
        
  public
    { Public declarations }
    rIdContrato : Double;
    rIdCorrecao : Double;
    dData       : TDateTime;
    sTexto      : String;    
  end;

var
  frmCadAditamentoMTDel: TfrmCadAditamentoMTDel;

implementation

uses FAltAditamentoMT,
     DBaseDados;   // Paulo Nobre - WO15750

{$R *.DFM}

procedure TfrmCadAditamentoMTDel.bbtnConfirmarClick(Sender: TObject);
var sIdParcMedicao, sDataAnterior : string;
begin
  // Paulo Nobre - WO15750 - Inicio
  Try
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    If (QryDadosAditamento.RecordCount > 0) or (cdsAditamento.RecordCount > 0) then
    begin
       if QryDadosAditamento.RecordCount > 0 then   // if MessageDlg('Todos os aditamentos posteriores ao selecionado também serão apagados! '  + #13 + 'Deseja continuar? ',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
       begin
         // Paulo Nobre - WO28914 - Inicio
{         sIdParcMedicao := '';
         while not QryDadosAditamento.Eof do
         begin
             sIdParcMedicao := sIdParcMedicao +  QryDadosAditamento.FieldByName('IDPARCMEDICAO').AsString;
             QryDadosAditamento.Next;
             if not QryDadosAditamento.Eof then
                sIdParcMedicao := sIdParcMedicao + ', ';
         end;
}
         // Paulo Nobre - WO28914 - Fim

         QryDadosAditamento.First;
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add(' SELECT * FROM CTRLPARCELAMEDICAO ');
         QryAux.SQL.Add(' WHERE FLGPARCELAMEDIDA = 1 ');
         QryAux.SQL.Add(' AND IDMEDICAO IS NOT NULL ' );
         QryAux.SQL.Add(' AND IDCONTRATO = ' +  QryDadosAditamento.FieldByName( 'IDCONTRATO' ).AsString);
         QryAux.SQL.Add(' AND IDADITAMENTO = ' +  QryDadosAditamento.FieldByName( 'IDADITAMENTO' ).AsString);  // Paulo Nobre - WO15750
         QryAux.Open;

         if QryAux.RecordCount > 0 then
         begin
            MessageDlg('Não é possível excluir aditamentos com parcela(s) já medida(s)!',mtConfirmation,[mbOK], 0);
            Abort;
         end;

         QryDadosAditamento.First;

         // Paulo Nobre - WO28914 - Inicio
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add(' DELETE FROM CTRLPARCELAMEDICAO ');
         QryAux.SQL.Add(' WHERE IDCONTRATO = ' +  cdsAditamento.FieldByName( 'IDCONTRATO' ).AsString );
         QryAux.SQL.Add('       AND IDADITAMENTO = ' + cdsAditamento.FieldByName('IDADITAMENTO').AsString);

     //    QryAux.SQL.Add(' WHERE IDPARCMEDICAO IN ( ' + sIdParcMedicao + ' )');
     //    QryAux.SQL.Add(' AND IDCONTRATO = ' +  QryDadosAditamento.FieldByName( 'IDCONTRATO' ).AsString);
         QryAux.ExecSQL;
        // Paulo Nobre - WO28914 - Fim
       end;

       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add(' DELETE FROM LOGADITAMENTO  ');
       QryAux.SQL.Add(' WHERE IDCONTRATO = ' + cdsAditamento.FieldByName('IDCONTRATO').AsString );
       if (cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsString <> '') then                                    //Ewerton Beltramini - SIG 114663 - 06/04/2021
          QryAux.SQL.Add(' AND IDADITAMENTO = ' +  cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsString)
       else if (QryDadosAditamento.FieldByName( 'IDADITAMENTO' ).AsString <> '') then                          //Ewerton Beltramini - SIG 114663 - 06/04/2021
          QryAux.SQL.Add(' AND IDADITAMENTO = ' +  QryDadosAditamento.FieldByName( 'IDADITAMENTO' ).AsString); //Ewerton Beltramini - SIG 114663 - 06/04/2021
       QryAux.ExecSQL;

       sDataAnterior := '';
       QryAuxLog.Close;
       QryAuxLog.SQL.Clear;
       QryAuxLog.SQL.Add(' SELECT max(TRGDTALTERACAO) AS DTANTERIOR ');
       QryAuxLog.SQL.Add(' FROM LOGPLANUS.LOG_PLANUS_CONTRATOCONTR C ');
       QryAuxLog.SQL.Add('   WHERE C.IDCONTRATO = ' +  cdsAditamento.FieldByName('IDCONTRATO').AsString);
       QryAuxLog.SQL.Add('     AND TRGDTALTERACAO < ( SELECT max(TRGDTALTERACAO)  AS DTULTIMO ');
       QryAuxLog.SQL.Add('                              FROM LOGPLANUS.LOG_PLANUS_CONTRATOCONTR C');
       QryAuxLog.SQL.Add('                             WHERE C.IDCONTRATO = ' +  cdsAditamento.FieldByName('IDCONTRATO').AsString + ' )');
       QryAuxLog.open;

       sDataAnterior := FormatDateTime('dd/mm/yyyy',QryAuxLog.FieldByName('DTANTERIOR').AsDateTime);
       if sDataAnterior <> '' then
       begin
          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(' UPDATE CONTRATOCONTR ');
          QryAux.SQL.Add(' SET DATABASECONTRATO = ' + QuotedStr(sDataAnterior) + ',' );
          QryAux.SQL.Add(' DATAPREVENCERRA = ' + QuotedStr(sDataAnterior) );
          QryAux.SQL.Add(' WHERE IDCONTRATO = ' +  cdsAditamento.FieldByName( 'IDCONTRATO' ).AsString);
          QryAux.ExecSQL;
       end;

       // Paulo Nobre - WO31928 - Inicio

       // PAULO NOBRE - WO15750 - Inicio
       // Se houve transferencia de saldo entre origem e destino
   {     QryAux.Close;
       QryAux.SQL.Clear;
       If cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString <> '' Then
       begin
         If cdsAditamento.FieldByName('ORIGEMVALORTRANSF').AsString = 'C' Then  // Origem = 'Contrato'
         begin
           QryAux.SQL.Add(' UPDATE CONTRATOCONTR ');
           QryAux.SQL.Add(' SET FLGSALDOTRANSFERIDO = ''N'' ');
           QryAux.SQL.Add(' WHERE IDCONTRATO = ' +  cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString );
           QryAux.ExecSQL;
         end
         else  // Origem = 'Aditamento'
           begin
             QryAux.SQL.Add(' UPDATE ADITAMENTO ');
             QryAux.SQL.Add(' SET FLGSALDOTRANSFERIDO = ''N'' ');
             QryAux.SQL.Add(' WHERE IDADITAMENTO = ' +  cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsString );
             QryAux.ExecSQL;
           end;
         end;
       // PAULO NOBRE - WO15750 - Fim   }

       // Paulo Nobre - WO31928 - Fim

       // Paulo Nobre - WO28914 - Inicio
       QryAux.Close;
       QryAux.SQL.Clear;
       QryAux.SQL.Add(' DELETE FROM ADITAMENTO' );
       QryAux.SQL.Add(' WHERE IDCONTRATO = ' +  cdsAditamento.FieldByName( 'IDCONTRATO' ).AsString );
       QryAux.SQL.Add('       AND IDADITAMENTO = ' + cdsAditamento.FieldByName('IDADITAMENTO').AsString);
       QryAux.ExecSQL;
       // Paulo Nobre - WO28914 - Fim
    end;

    frmAltAditamentoMT.sbtnApagar.Visible:= false;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  except
     on e: Exception do
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;
        end;
  end;
  // Paulo Nobre - WO15750 - Fim
end;

procedure TfrmCadAditamentoMTDel.FormShow(Sender: TObject);
begin
  inherited;
  if (cdsAditamento.Active) then begin
    if rIdCorrecao = 0 then begin
       cdsAditamento.Insert;
    end else begin
       if cdsAditamento.Locate('ID_TEMP',rIdCorrecao,[]) then
            cdsAditamento.Edit
       else cdsAditamento.Insert;
    end;
    cdsAditamento.FieldByName('IDCONTRATO').AsFloat := rIdContrato;
    cdsAditamento.FieldByName('ID_TEMP').AsFloat    := rIdCorrecao;
    //Fernando Xavier - SIG 41489
    //cdsAditamento.FieldByName('FLGTIPO').AsString   := 'A'
    if cdsAditamento.State = dsInsert then
       cdsAditamento.FieldByName('FLGTIPO').AsString   := 'A'
    else
    begin
       rbAditamento.Checked := (cdsAditamento.FieldByName('FLGTIPO').AsString  = 'A');
       rbOutros.Checked     := (cdsAditamento.FieldByName('FLGTIPO').AsString  = 'C');
    end;
    //Fernando Xavier - SIG 41489

    if cdsAditamento.State = dsInsert then begin
       if dData > 0    then cdsAditamento.FieldByName('DATAASSADITAMENTO').AsDateTime := dData;
       if sTexto <> '' then cdsAditamento.FieldByName('DESCADITAMENTO').AsString      := sTexto;
    end;
  end;

    QryDadosAditamento.close;
    QryDadosAditamento.ParamByName('IDCONTRATO').AsString   := cdsAditamento.FieldByName( 'IDCONTRATO' ).AsString;
    QryDadosAditamento.ParamByName('IDADITAMENTO').AsString := frmAltAditamentoMT.cdsAditamento.FieldByName( 'IDADITAMENTO' ).AsString;
    QryDadosAditamento.open;  

end;

end.

unit fParamExtratoConta;

interface
       
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, DBTables, Wwquery, wwdblook, IvDictio, IvMulti, IvEMulti,
  ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmExtratoConta = class(TfrmOkCancelar)
    Label4: TLabel;
    qryConta: TwwQuery;
    dblkcmbConta: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    Label3: TLabel;
    rgrpStatus: TRadioGroup;
    qryContaCODPORTADOR: TFloatField;
    qryContaDESCRICAO: TStringField;
    rgrpData: TRadioGroup;
    cbComMov: TCheckBox;
    lblModulo: TLabel;
    dblcModulo: TwwDBLookupCombo;
    qryModulo: TwwQuery;
    qryModuloIDMODULO: TFloatField;
    qryModuloNOMEMODULO: TStringField;
    cbSaltaFolha: TCheckBox;
    rgrpOrdenacao: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgrpStatusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure MontaQryRelatorio;
  public
    { Public declarations }
  end;

var
  frmExtratoConta: TfrmExtratoConta;

implementation

uses DRelatoriosCFinan,uSistema, uMensErro, uDataBase;

{$R *.DFM}

procedure TfrmExtratoConta.FormCreate(Sender: TObject);
begin
  inherited;
  deDataInicial.Date:=Now;
  deDataFinal.Date:=Now;
end;

procedure TfrmExtratoConta.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
  rgrpData.Enabled   := False;
  //
  qryConta.Close;
  qryConta.ParamByName('IDEMPRESA').Value:=Sistema.IdEmpresa;
  qryConta.Open;
  //
  qryModulo.Close;
  qryModulo.Open;
end;

procedure TfrmExtratoConta.bbtnConfirmarClick(Sender: TObject);
Var
   qryCalculaSaldo, qryExtrato, qryContaAux: TwwQuery;
   rSaldoTot, rSaldo : Real;
   bEntrou,bMov : Boolean;
   sSql : String;
   sTitulo : String;
begin
   inherited;

   if (deDataInicial.Text = '') Or (deDataFinal.Text = '') then
    begin
       MsgDlg('Indicar o período do extrato','Erro',mtError,[mbOk],0);
       ModalResult := MrCancel;
       Exit;
    end;

   qryCalculaSaldo := Twwquery.Create(Application);
   qryCalculaSaldo.DataBasename := 'BaseDados';
   qryCalculaSaldo.Filtered := True;

   qryExtrato := Twwquery.Create(Application);
   qryExtrato.DataBasename := 'BaseDados';
   qryExtrato.Filtered := True;

   qryContaAux := Twwquery.Create(Application);
   qryContaAux.DataBasename := 'BaseDados';
   qryContaAux.Filtered := True;

   dtmRelatoriosCFinan.rpExtratoConta.Groups[0].NewPage := cbSaltaFolha.Checked;

   Try
      qryExtrato.Close;
      qryExtrato.Sql.Text :=
      ' SELECT '+
      ' M.CODPORTADOR AS CODIGO, '+
      ' M.CODLANCFINANC AS CODFINANC, '+
      ' M.NUMCHQBORDERO AS BORDERO, ';
      case rgrpData.ItemIndex of
         0 : qryExtrato.SQL.add(' M.DATALANCFINAN AS DATA, ');
         1 : qryExtrato.SQL.add(' M.DATACONCILIACAO AS DATA, ');
      end;
      qryExtrato.SQL.add(' M.ENTRADASAIDA, ' +
                         ' M.HISTORICO, '+
                         ' M.STATUSCONCILIA AS STATUS, '+
                         ' C.DESCRICAO, '+
                         ' DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN*-1,M.VALORLANCFINAN) AS VALOR, '+
                         ' DECODE(M.ENTRADASAIDA,''S'',0,M.VALORLANCFINAN) AS VALORENTRADA, '+
                         ' DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN,0) AS VALORSAIDA, '+
                         ' (0) AS SALDOANTERIOR, (0) AS SALDOREGISTRO ' +
                         ' FROM MOVIMFINANC M, PORTADORCONTA C '+
                         ' WHERE '+
                         ' ((C.FLGSTATUS = '+#39+'A'+#39+') OR (C.FLGSTATUS is null)) AND '+
                         ' (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND ');

      case rgrpData.ItemIndex of
         0 : QryExtrato.SQL.add(' (M.DATALANCFINAN >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY'')) AND '+
                                ' (M.DATALANCFINAN <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY''))');
         1 : QryExtrato.SQL.add(' (M.STATUSCONCILIA <> ''J'') AND '+
                                ' (M.DATACONCILIACAO >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY'')) AND '+
                                ' (M.DATACONCILIACAO <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY''))');
      end;
      if Trim(dblkcmbConta.text ) <> '' then
        QryExtrato.SQL.add(' AND (M.CODPORTADOR = ' + dblkcmbConta.LookupValue+')');
      if Trim(dblcModulo.text ) <> '' then
        QryExtrato.SQL.add(' AND (M.IDMODULO = ' + dblcModulo.LookupValue+')');

      case rgrpStatus.ItemIndex of
         1 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA IN (''P'',''I'',''X''))');
         2 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA <> ''C'')');
         3 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA = ''C'')');
         4 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA IN (''N'',''C''))');
         5 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA = ''I'')');
         6 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA <> ''J'')');
         7 : QryExtrato.SQL.add(' AND (M.STATUSCONCILIA <> ''C'') AND (M.STATUSCONCILIA <> ''J'')');
      end;

      QryExtrato.SQL.Add(' AND (C.CODPORTADOR = M.CODPORTADOR) ORDER BY M.CODPORTADOR, ');

      case rgrpData.ItemIndex of
         0 : QryExtrato.SQL.add('M.DATALANCFINAN, M.CODLANCFINANC');
         1 : QryExtrato.SQL.add('M.DATACONCILIACAO, M.CODLANCFINANC');
      end;

      QryExtrato.Open;

      sSql := ' SELECT  '+
              ' M.CODPORTADOR, '+
              ' SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN*-1,M.VALORLANCFINAN)) AS SALDOANTERIOR '+
              ' FROM MOVIMFINANC M ' +
              ' WHERE '+
              ' (M.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') AND ';
      case rgrpData.ItemIndex of
         0 : sSql:=sSql + ' (M.DATALANCFINAN < TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))';
         1 : sSql:=sSql + ' (M.STATUSCONCILIA <> ''J'') AND (M.DATACONCILIACAO < TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY''))';
      end;

      if Trim(dblkcmbConta.text ) <> '' then
         sSql := sSql + ' AND (M.CODPORTADOR = ' + dblkcmbConta.LookupValue+')';

      case rgrpStatus.ItemIndex of
         1 : sSql := sSql + ' AND (M.STATUSCONCILIA IN (''P'',''I'',''X''))';
         2 : sSql := sSql + ' AND (M.STATUSCONCILIA <> ''C'')';
         3 : sSql := sSql + ' AND (M.STATUSCONCILIA = ''C'')';
         4 : sSql := sSql + ' AND (M.STATUSCONCILIA IN (''N'',''C''))';
         5 : sSql := sSql + ' AND (M.STATUSCONCILIA = ''I'')';
         6 : sSql := sSql + ' AND (M.STATUSCONCILIA <> ''J'')';
         7 : sSql := sSql + ' AND (M.STATUSCONCILIA <> ''C'') AND (M.STATUSCONCILIA <> ''J'')';
      end;

      sSql := sSql +  ' GROUP BY M.CODPORTADOR ORDER BY M.CODPORTADOR';

      FazQuery(QryCalculaSaldo,sSql);

      sSql:='SELECT CODPORTADOR,DESCRICAO FROM PORTADORCONTA WHERE '+
            '((FLGSTATUS = '+#39+'A'+#39+') OR (FLGSTATUS is null)) '+
            ' AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+') ';

      if Trim(dblkcmbConta.text ) <> '' then
         sSql := sSql + ' AND (CODPORTADOR = ' + dblkcmbConta.LookupValue+') ';

      sSql := sSql + ' ORDER BY CODPORTADOR';
      //
      QryContaAux.Close;
      QryContaAux.Sql.Text :=sSQL;
      QryContaAux.Open;
      //
      with dtmRelatoriosCFinan.gryExtratoConta do
      begin
        if Active then
         begin
            if UpdatesPending then CancelUpdates;
            Close;
         end;

        rSaldoTot:=0;
        MontaQryRelatorio;
        sSql:=dtmRelatoriosCFinan.gryExtratoConta.SQL.Text;
        Open;

        QryContaAux.First;
        while not QryContaAux.Eof do
        begin
           rSaldo :=0;
           bEntrou:=False;
           bMov   :=False;
           QryCalculaSaldo.Filter := 'CODPORTADOR = ' + QryContaAux.FieldByName('CodPortador').AsString;
           QryCalculaSaldo.First;

           while not QryCalculaSaldo.Eof do
           begin
              Append;
              FieldByName('CODIGO').AsInteger      := QryCalculaSaldo.FieldByName('CodPortador').AsInteger;
              FieldByName('DATA').AsDateTime       := deDataInicial.Date - 1;
              FieldByName('HISTORICO').AsString    := 'Saldo Anterior';
              FieldByName('DESCRICAO').AsString    := QryContaAux.FieldByName('Descricao').AsString;
              FieldByName('SALDOREGISTRO').AsFloat := QryCalculaSaldo.FieldByName('SALDOANTERIOR').AsFloat;
              FieldByName('SALDOTOTAL').AsFloat    := rSaldoTot + QryCalculaSaldo.FieldByName('SALDOANTERIOR').AsFloat;
              Post;
              bEntrou:=True;
              //
              rSaldo    := FieldByName('SALDOREGISTRO').AsFloat;
              rSaldoTot := FieldByName('SALDOTOTAL').AsFloat;
              QryCalculaSaldo.Next;
           end;

           if not bEntrou then
            begin
               Append;
               FieldByName('CODIGO').AsInteger      := QryContaAux.FieldByName('CodPortador').AsInteger;
               FieldByName('DATA').AsDateTime       := deDataInicial.Date - 1;
               FieldByName('HISTORICO').AsString    := 'Saldo Anterior';
               FieldByName('DESCRICAO').AsString    := QryContaAux.FieldByName('Descricao').AsString;
               FieldByName('SALDOREGISTRO').AsFloat := 0;
               Post;
            end;

           //Adiciona o Movimento do Financeiro
           QryExtrato.Filter := 'CODIGO = ' + QryContaAux.FieldByName('CodPortador').AsString;
           QryExtrato.First;

           while not QryExtrato.Eof do
           begin
              Append;
              FieldByName('BORDERO').AsString     := QryExtrato.FieldByName('BORDERO').AsString;
              FieldByName('CODIGO').AsInteger     := QryExtrato.FieldByName('CODIGO').AsInteger;
              FieldByName('DATA').AsDateTime      := QryExtrato.FieldByName('DATA').AsDateTime;
              FieldByName('HISTORICO').AsString   := QryExtrato.FieldByName('HISTORICO').AsString;
              FieldByName('DESCRICAO').AsString   := QryContaAux.FieldByName('DESCRICAO').AsString;
              FieldByName('VALORSAIDA').AsFloat   := QryExtrato.FieldByName('VALORSAIDA').AsFloat;
              FieldByName('VALORENTRADA').AsFloat := QryExtrato.FieldByName('VALORENTRADA').AsFloat;
              FieldByName('SALDOREGISTRO').AsFloat:= rSaldo + QryExtrato.FieldByName('VALOR').AsFloat;
              FieldByName('SALDOTOTAL').AsFloat   := rSaldoTot + QryExtrato.FieldByName('VALOR').AsFloat;
              FieldByName('STATUS').AsString      := QryExtrato.FieldByName('STATUS').AsString;
              Post;
              rSaldo    := FieldByName('SALDOREGISTRO').AsFloat;
              rSaldoTot := FieldByName('SALDOTOTAL').AsFloat;
              bMov   :=True;
              QryExtrato.Next;
           end;

            if (cbComMov.Checked) and (not bMov) then begin
               Delete;
            end;
            QryContaAux.Next;
         end;
       end;
    
       case rgrpData.ItemIndex of
            0 : sTitulo:=' - Data do Lançamento';
            1 : sTitulo:=' - Data da Conciliação';
       end;
       dtmRelatoriosCFinan.gryExtratoConta.First;
       dtmRelatoriosCFinan.lbData.caption   := deDataInicial.Text+ ' à ' + deDataFinal.Text+sTitulo;
       dtmRelatoriosCFinan.lbStatus.caption := rgrpStatus.Items.strings[rgrpStatus.itemindex];
 except
   ModalResult := MrCancel;
 end;

 QryExtrato.Free;
 QryCalculaSaldo.Free;
end;


procedure TfrmExtratoConta.rgrpStatusClick(Sender: TObject);
begin
  inherited;
  if rgrpStatus.ItemIndex = 1 then begin
     rgrpData.Enabled:=True;
  end else begin
     rgrpData.ItemIndex := 0;
     rgrpData.Enabled   :=False;
  end;
end;


procedure TfrmExtratoConta.MontaQryRelatorio;
begin
   if dtmRelatoriosCFinan.gryExtratoConta.Active then dtmRelatoriosCFinan.gryExtratoConta.Close;
   with dtmRelatoriosCFinan.gryExtratoConta.SQL do
   begin
      Clear;
      Add('SELECT');
      Add('   M.CODPORTADOR AS CODIGO,');
      Add('   M.CODLANCFINANC AS CODFINANC,');
      Add('   M.NUMCHQBORDERO AS BORDERO,');
      Add('   M.DATALANCFINAN AS DATA,');
      Add('   M.ENTRADASAIDA,');
      Add('   M.HISTORICO,');
      Add('   M.STATUSCONCILIA AS STATUS,');
      Add('   C.DESCRICAO,');
      Add('   SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN*-1,M.VALORLANCFINAN)) AS VALOR,');
      Add('   SUM(DECODE(M.ENTRADASAIDA,''S'',0,M.VALORLANCFINAN)) AS VALORENTRADA,');
      Add('   SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN,0)) AS VALORSAIDA,');
      Add('   (0) AS SALDOANTERIOR,');
      Add('   (0) AS SALDOREGISTRO,');
      Add('   (0) AS SALDOTOTAL');
      Add('FROM ');
      Add('   MOVIMFINANC M, PORTADORCONTA C');
      Add('WHERE');
      Add('   (1=2)');
      Add('GROUP BY');
      Add('   M.CODPORTADOR,');
      Add('   M.CODLANCFINANC,');
      Add('   M.NUMCHQBORDERO,');
      Add('   M.DATALANCFINAN,');
      Add('   M.ENTRADASAIDA,');
      Add('   M.HISTORICO,');
      Add('   M.STATUSCONCILIA,');
      Add('   C.DESCRICAO');
      Add('ORDER BY');
      Add('   M.CODPORTADOR,');
      Add('   M.DATALANCFINAN');

      case rgrpOrdenacao.ItemIndex of
         1: Add('   ,VALOR');
         2: Add('   ,M.NUMCHQBORDERO');         
      end;
   end;
end;

end.



{-------------------------------------------------------------------------------
Data      : 24/09/2007
Autor     : Marcus Oliveira
Pendência : 26378
Descrição : Criado os campos nas query "D.QTDECOTAS, D.DATAPROGRAMADA E D.DATADISPONIB"
{-------------------------------------------------------------------------------

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Regularização de Adiantamento                       }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 21/10/2002                             }
{                                                       }
{*******************************************************}

unit FRegAdiantoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, DBCtrls, MontaSelect,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  DBClient, uCMClientDataSet, uCmSqlParams, Db, uCtrlDocumento, uCtrlLancDocCapCar;

type
  TFrmRegAdiantoMT = class(TfrmOkCancelar)
    dsAdtoPendente: TwwDataSource;
    Panel1: TPanel;
    LblDocPagos: TPanel;
    dbgrAdtoPendente: TwwDBGrid;
    Panel2: TPanel;
    SbAdInverte: TSpeedButton;
    SbAdTodos: TSpeedButton;
    GroupBox1: TGroupBox;
    DbreValRegAdt: TDBRealEdit;
    MontaSelect: TMontaSelect;
    GroupBox2: TGroupBox;
    DtReg: TCMDateTimePicker;
    SQLAdtoPendente: TCMSqlParams;
    CdsAdtoPendente: TCMClientDataSet;
    CdsDocumento: TCMClientDataSet;
    SQLDocumento: TCMSqlParams;
    Panel3: TPanel;
    GpDocumento: TGroupBox;
    LblSisOrigem: TLabel;
    LblFornCli: TLabel;
    LblDataProg: TLabel;
    LblDocCompl: TLabel;
    LblSaldo: TLabel;
    BtnSeleciona: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelecionaClick(Sender: TObject);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrAdtoPendenteDblClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsAdtoPendenteAfterOpen(DataSet: TDataSet);
    procedure dbgrAdtoPendenteTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    _Documento: TCtrlDocumento;
    _LancDocCapCar: TCtrlLancDocCapCar;

    procedure InverteSelecao( DataSet: TDataSet );
    procedure SelecionaTodos( DataSet: TDataSet );
    procedure CalculaSaldo;
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  FrmRegAdiantoMT: TFrmRegAdiantoMT;

implementation

Uses uModulo, uSistema, uMensErro, uCtrlParamIntegra;

{$R *.DFM}

procedure TFrmRegAdiantoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _Documento.InitializeAs(ParamIntegra);

  _LancDocCapCar := TCtrlLancDocCapCar.Create;
  _LancDocCapCar.InitializeAs(ParamIntegra);

  if ParamIntegra.Recpag = 'P' then
  begin
// Daniel Simões - 25/01/2006 Início--------------------------------------------
    HelpContext           := 30019;
    bbtnAjuda.HelpContext := 30019;
  end
  else
  begin
    HelpContext           := 40034;
    bbtnAjuda.HelpContext := 40034;
// Daniel Simões - 25/01/2006 Fim-----------------------------------------------
  end;
  DtReg.Date := Date;

  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = '''+ ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('LANCTODOCUM.OPERACAO IN (''1'',''2'')');
  MontaSelect.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))');

  LimpaTela;
end;

procedure TFrmRegAdiantoMT.BtnSelecionaClick(Sender: TObject);
Var
  sSql: String;
begin
  inherited;

  If MontaSelect.Executar = MrOk Then
  Begin
     _Documento.Saldo.CalculaSaldo( StrToInt(MontaSelect.ValoresChave[0]) );

     LblSaldo.Caption := 'Saldo: ' + FloatToStrF( _Documento.Saldo.Valor, ffNumber, 17, 2);

     If ParamIntegra.RecPag = 'R' Then
        LblFornCli.Caption := 'Cliente: ' + MontaSelect.ValoresChave[4]
     Else
        LblFornCli.Caption := 'Fornecedor: ' + MontaSelect.ValoresChave[4];

     LblDocCompl.Caption := 'Doc\Compl: ' + MontaSelect.ValoresChave[1] + ' ' + MontaSelect.ValoresChave[2];

     LblDataProg.Caption := 'Data Prog: ' + MontaSelect.ValoresChave[3];

     LblSisOrigem.Caption := 'Sistema de Origem: ' + MontaSelect.ValoresChave[7];

     sSql := 
     ' SELECT D.QTDECOTAS, D.DATAPROGRAMADA, D.DATADISPONIB, D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA,L.DATALANCTO, ' +
     ' D.DATAVENCTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.RECPAG, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM ' +
     ' FROM DOCUMENTO D, LANCTODOCUM L, ' +
     ' PESSOA P ' +
     ' WHERE (D.IDPESSOA = :iEmpresa) AND ' +
     ' (D.RECPAG = :pRecPag) AND ' +
     ' (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
     ' (L.OPERACAO = ''15'') AND ' +
     ' (D.IDFORCLI = :IForCli) AND ' +
     ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (d.idforcli=p.idpessoa)AND ' +
     ' d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))';

     If ParamIntegra.RecPag = 'R' Then
        sSql := sSql +
        ' UNION ' +
        ' SELECT D.QTDECOTAS, D.DATAPROGRAMADA, D.DATADISPONIB, D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA, L.DATALANCTO, ' +
        ' D.DATAVENCTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.RECPAG, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM  ' +
        ' FROM DOCUMENTO D, LANCTODOCUM L, CLIENTEPESS C, PESSOA P ' +
        '  WHERE (D.IDPESSOA = :iEmpresa) AND ' +
        '  (D.RECPAG = :pRecPag) AND ' +
        '  (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
        '  (L.OPERACAO = ''15'') AND ' +
        '  (C.IDTIPOCLIENTE = :idTipoCliAd) AND ' +
        '  (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
        '  (P.IDPESSOA = D.IDFORCLI) AND ' +
        '  (C.IDPESSOA = D.IDFORCLI) and '+
        ' D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))'

     Else
        sSql := sSql +
        'UNION ' +
        ' SELECT D.QTDECOTAS, D.DATAPROGRAMADA, D.DATADISPONIB, D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, (0) AS VALRES, (0) VLRBAIXA,L.DATALANCTO, ' +
        ' D.DATAVENCTO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.RECPAG, D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM  ' +
        ' FROM DOCUMENTO D, LANCTODOCUM L, ' +
        ' PESSOA P ' +
        ' WHERE (D.IDPESSOA = :iEmpresa) AND ' +
        ' (D.RECPAG = :pRecPag) AND ' +
        ' (D.STATUS <> ''2'' OR D.STATUS IS NULL)  AND ' +
        ' (L.OPERACAO = ''15'') AND ' +
        ' (D.IdForCli IN (SELECT IDPESSOA FROM FORNXRAMO WHERE IDRAMOFORNECEDOR = ' + IntToStr(Modulo.RamoFornAdianto) + ')) AND ' +
        ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND ' +
        ' (P.IDPESSOA = D.IDFORCLI) and '+
        ' D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))';


     SQLAdtoPendente.Sql.Text := sSql;

     {**************************************************************************}


     SQLAdtoPendente.Prepare;
     SQLAdtoPendente.ParamByName('iEmpresa').AsFloat := Sistema.IdEmpresa;
     SQLAdtoPendente.ParamByName('iForCli').AsFloat := StrToFloat(MontaSelect.ValoresChave[5]);

     If ParamIntegra.RecPag = 'R' Then
       SQLAdtoPendente.ParamByName('idTipoCliAd').AsFloat := Modulo.IdTipoCliAdianto;

     SQLAdtoPendente.ParamByName('pRecPag').AsString := ParamIntegra.RecPag;
     SQLAdtoPendente.Open;

     {**************************************************************************}

     SQLDocumento.Prepare;
     SQLDocumento.ParamByName('CODDOCUMENTO').AsFloat := StrToInt(MontaSelect.ValoresChave[0]);
     SQLDocumento.Open;

     {**************************************************************************}
     
     CalculaSaldo;
  End;
end;

procedure TFrmRegAdiantoMT.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  SelecionaTodos( CdsAdtoPendente );
end;

procedure TFrmRegAdiantoMT.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  InverteSelecao( CdsAdtoPendente );
end;

procedure TFrmRegAdiantoMT.SelecionaTodos(  DataSet: TDataSet  );
begin
  inherited;
  With DataSet Do
  Begin
    DisableControls;
    First;
    While Not Eof Do
    Begin
      Edit;
      FieldByName('STATUS').AsString := '2';
      Post;
      Next;
    End;
    EnableControls;
  End;
end;

procedure TFrmRegAdiantoMT.InverteSelecao(  DataSet: TDataSet );
begin
  inherited;
  With DataSet Do
  Begin
    DisableControls;
    First;
    While Not Eof Do
    Begin
      Edit;
      If FieldByName('STATUS').AsString = '2' Then
         FieldByName('STATUS').AsString := '0'
      Else
         FieldByName('STATUS').AsString := '2';
      Post;
      Next;
    End;
    EnableControls;
  End;
end;

procedure TFrmRegAdiantoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     If DtReg.Text = '' Then
        MsgDlg('Informar a data de regularização do adiantamento','Atenção',mtError,[mbOk],0)
     Else
     begin
       if _LancDocCapCar.RegularizaAdiantamento( CdsAdtoPendente.Data, CdsDocumento.Data, Sistema.IdUsuario, Sistema.IdEspAcesso,
          ParamIntegra.IntegraContab, Sistema.UsaPlanoPatro, DtReg.Date ) then
         MsgDlg('Adiantamento regularizado com sucesso!','Atenção',mtInformation,[mbOk],0)
       else
         MsgDlg(_LancDocCapCar.MessageInfo,'Erro', mtError,[mbOk],0);
       end;

     LimpaTela;
  End;
end;

procedure TFrmRegAdiantoMT.dbgrAdtoPendenteDblClick(Sender: TObject);
begin
  inherited;

  With (Sender as TwwDbGrid) Do
    If Not DataSource.DataSet.IsEmpty Then
    Begin
       DataSource.DataSet.Edit;

       If DataSource.DataSet.FieldByName('STATUS').AsInteger = 0 Then
          DataSource.DataSet.FieldByName('STATUS').AsInteger := 2
       Else
          DataSource.DataSet.FieldByName('STATUS').AsInteger := 0;

       DataSource.DataSet.Post;
    End;
end;


procedure TFrmRegAdiantoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmRegAdiantoMT.CalculaSaldo;
Begin
  With CdsAdtoPendente Do
  Begin
    First;
    While Not Eof Do
    Begin
      Edit;
      _Documento.Saldo.CalculaSaldo( CdsAdtoPendente.FieldByName('CODDOCUMENTO').AsInteger );
      FieldByName('VLRBAIXA').Asstring := FloatToStrF( _Documento.Saldo.Valor * -1, fffixed, 17, 2);
      FieldByName('VALRES').Asstring   := FloatToStrF( _Documento.Saldo.Valor * -1, fffixed, 17, 2);
      Post;
      Next;
    End;
    First;
  End;
End;

procedure TFrmRegAdiantoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Documento.Free;
  _LancDocCapCar.Free;
end;

procedure TFrmRegAdiantoMT.CdsAdtoPendenteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALRES') ).DisplayFormat := '#,##0.00';
  TFloatField( DataSet.FieldByName('VLRBAIXA') ).DisplayFormat := '#,##0.00';
end;

procedure TFrmRegAdiantoMT.LimpaTela;
begin
  With SQLAdtoPendente Do
  Begin
    SQL.Clear;
    SQL.Add(' SELECT ');
    SQL.Add('   D.STATUS, ');
    SQL.Add('   P.RAZAOSOCIAL, ');
    SQL.Add('   D.NODOCUMENTO, ');
    SQL.Add('   D.CODDOCUMENTO, ');
    SQL.Add('   (0) AS VALRES, ');
    SQL.Add('   (0) VLRBAIXA, ');
    SQL.Add('   L.DATALANCTO, ');
    SQL.Add('   D.DATAVENCTO, ');
    SQL.Add('   D.NODOCUMENTO, ');
    SQL.Add('   D.COMPLDOCUMENTO, ');
    SQL.Add('   D.RECPAG, ');
    SQL.Add('   D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM ');
    SQL.Add(' FROM ');
    SQL.Add('   DOCUMENTO D, ');
    SQL.Add('   LANCTODOCUM L, ');
    SQL.Add('   PESSOA P ');
    SQL.Add(' WHERE ');
    SQL.Add('   1 = 2 ');
    Open;
  End;

  If ParamIntegra.RecPag = 'R' Then
     LblFornCli.Caption := 'Cliente'
  Else
     LblFornCli.Caption := 'Fornecedor';
     
  LblSisOrigem.Caption := 'Sistema de Origem:';
  LblDocCompl.Caption := 'Doc\Compl:';
  LblDataProg.Caption := 'Data Prog:';
  LblSaldo.Caption := 'Saldo:';
End;





procedure TFrmRegAdiantoMT.dbgrAdtoPendenteTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  //  Rodolpho da Silva - P: 18588 - 22/06/2005
  CdsAdtoPendente.IndexFieldNames := AFieldName;
end;

end.

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

unit FEstAdiantamentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, MontaSelect,
  DBTables, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlDocumento, uCtrlLancDocCapCar;

type
  TFrmEstAdiantamentoMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    LblDocPagos: TPanel;
    dbgrAdtoregularizados: TwwDBGrid;
    MontaSelect: TMontaSelect;
    dsAdtoregularizados: TwwDataSource;
    BtnEstornar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    SQLAdtoRegularizados: TCMSqlParams;
    CdsAdtoRegularizados: TCMClientDataSet;
    CMClientDataSet1: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    wwDataSource1: TwwDataSource;
    Panel2: TPanel;
    GpDocumento: TGroupBox;
    LblSisOrigem: TLabel;
    LblFornCli: TLabel;
    LblDataProg: TLabel;
    LblDocCompl: TLabel;
    LblSaldo: TLabel;
    BtnSeleciona: TBitBtn;
    procedure BtnSelecionaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEstornarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CdsAdtoRegularizadosAfterOpen(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrAdtoregularizadosTitleButtonClick(Sender: TObject;
      AFieldName: String);

  private
    { Private declarations }
    _Documento: TCtrlDocumento;
    _LancDocCapCar: TCtrlLancDocCapCar;
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  FrmEstAdiantamentoMT: TFrmEstAdiantamentoMT;

implementation

Uses uModulo, uSistema, uMensErro, uCtrlParamIntegra;
{$R *.DFM}

procedure TFrmEstAdiantamentoMT.BtnSelecionaClick(Sender: TObject);
begin
  inherited;

  If MontaSelect.Executar = MrOk Then
  Begin
     LblSaldo.Caption := 'Saldo: ' + FormatFloat('#,##0.00',StrToFloat(MontaSelect.ValoresChave[9]));

     If ParamIntegra.RecPag = 'R' Then
        LblFornCli.Caption := 'Cliente: ' + MontaSelect.ValoresChave[4]
     Else
        LblFornCli.Caption := 'Fornecedor: ' + MontaSelect.ValoresChave[4];

     LblDocCompl.Caption := 'Doc\Compl: ' + MontaSelect.ValoresChave[1] + ' ' + MontaSelect.ValoresChave[2];

     LblDataProg.Caption := 'Data Prog: ' + MontaSelect.ValoresChave[3];

     LblSisOrigem.Caption := 'Sistema de Origem: ' + MontaSelect.ValoresChave[7];

     With SqlAdtoRegularizados do
     Begin
        SQL.Clear;
        SQL.Add('SELECT DISTINCT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, ');
        SQL.Add('D.CODDOCUMENTO,d.plano, L.VALOR,L.DATALANCTO,L.NUMLANCTO,L.PLNCODIGO, ');
        SQL.Add('D.DATAVENCTO, D.NODOCUMENTO,D.MOECODIGO ,D.COMPLDOCUMENTO');
        SQL.Add('FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P ');
        SQL.Add('WHERE (D.CODDOCUMENTO=L.CODDOCUMENTO)');
        SQL.Add('AND   (D.IDFORCLI=P.IDPESSOA)');
        SQL.Add('AND   (L.ESTORNO IS NULL)');
        SQL.Add('AND   (L.OPERACAO=''16'')');
        SQL.Add('AND   (D.RECPAG  = ''' + ParamIntegra.RecPag + ''')');
        SQL.Add('AND   (D.IDPESSOA=' + INTTOSTR(Sistema.IdEmpresa)+ ')');
        SQL.Add(' and D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))');

        if Not ParamIntegra.IntegraContab then
        begin
             If ParamIntegra.RecPag = 'P' Then
             begin
                 SQL.Add('AND  (    (D.IDFORCLI IN (SELECT IDPESSOA FROM FORNXRAMO WHERE IDRAMOFORNECEDOR = ' + IntToStr(Modulo.RamoFornAdianto) + ')) ' );
                 SQL.Add('       OR (D.IDFORCLI='+MontaSelect.ValoresChave[5]+'))');
             end
             else
             begin
                 SQL.Add('AND  (    (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIENTEPES  WHERE IDTIPOCLIENTE = ' + IntToStr(Modulo.IdTipoCliAdianto) + ')) ' );
                 SQL.Add('       OR (D.IDFORCLI='+MontaSelect.ValoresChave[5]+'))');
             end;

             SQL.Add('AND   L.VALOR = :IVALOR');
             SQL.Add('AND   L.DATALANCTO ='+#39+(MontaSelect.ValoresChave[6])+#39);

             prepare;
             ParamByName('IVALOR').asfloat:=strtofloat(MontaSelect.ValoresChave[9]);
        end
        else
        begin
            SQL.Add('AND (L.PLNCODIGO='+MontaSelect.ValoresChave[8]+')');
        end;

        Open;
     end;
  end ;
end;


procedure TFrmEstAdiantamentoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _Documento := TCtrlDocumento.Create;
  _Documento.InitializeAs( ParamIntegra );
  _LancDocCapCar := TCtrlLancDocCapCar.Create;
  _LancDocCapCar.InitializeAs( ParamIntegra );

  if ParamIntegra.RecPag = 'P' then
  begin
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30020;
    bbtnAjuda.HelpContext := 30020;
  end
  else
  begin
    HelpContext           := 40035;
    bbtnAjuda.HelpContext := 40035;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;

  MontaSelect.Filtro.Add('DOCUMENTO.RECPAG = '''+ParamIntegra.RecPag+'''');
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.ADD('LANCTODOCUM.ESTORNO IS NULL');
  MontaSelect.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.RecPag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))');

  LimpaTela;

  SqlAdtoRegularizados.Open;

  bbtnConfirmar.Enabled := ( Not ParamIntegra.EstornaContab ); 
end;

procedure TFrmEstAdiantamentoMT.LimpaTela;
begin
  With SqlAdtoRegularizados Do
  Begin
    SQL.Clear;
    SQL.Add(' SELECT D.STATUS, D.PLANO, P.RAZAOSOCIAL, D.NODOCUMENTO, D.CODDOCUMENTO, (0) VALOR,L.DATALANCTO,');
    SQL.Add('        D.DATAVENCTO, D.COMPLDOCUMENTO, D.MOECODIGO, L.NUMLANCTO, L.PLNCODIGO ');
    SQL.Add(' FROM DOCUMENTO D, LANCTODOCUM L,');
    SQL.Add(' PESSOA P');
    SQL.Add(' WHERE');
    SQL.Add(' 1=2 ');
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

procedure TFrmEstAdiantamentoMT.BtnEstornarClick(Sender: TObject);
begin
  inherited;
  if not CdsAdtoRegularizados.IsEmpty then
  begin
     if not _Documento.Estornar( StrToDate( MontaSelect.ValoresChave[6] ), Sistema.IdModulo,
                                 Sistema.IdEmpresa,
                                 Sistema.IdUsuario,
                                 CdsAdtoregularizados.FieldByName('CODDOCUMENTO').AsInteger,
                                 CdsAdtoregularizados.FieldByName('NUMLANCTO').AsInteger,
                                 ParamIntegra.Plano,
                                 Sistema.UsaPlanoPatro,
                                 oeDialogProcessa,
                                 StrToInt(MontaSelect.ValoresChave[0]),
                                 StrToInt(MontaSelect.ValoresChave[10])) Then
        MsgDlg(  _Documento.MessageInfo, 'Erro', mtError, [ mbOk ], 0 );

     LimpaTela;
  end;
end;

procedure TFrmEstAdiantamentoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmEstAdiantamentoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Documento.Free;
  _LancDocCapCar.Free;
end;

procedure TFrmEstAdiantamentoMT.CdsAdtoRegularizadosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VALOR') ).DisplayFormat := '#,##0.00';
end;

procedure TFrmEstAdiantamentoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not CdsAdtoRegularizados.IsEmpty then
  begin
     if not _LancDocCapCar.ExcluiRegulariazaoPrevAdianto( StrToInt(MontaSelect.ValoresChave[0]),
                                                          StrToInt(MontaSelect.ValoresChave[10]),
                                                          CdsAdtoregularizados.FieldByName('CODDOCUMENTO').AsInteger,
                                                          CdsAdtoregularizados.FieldByName('NUMLANCTO').AsInteger,
                                                          Sistema.IdEspAcesso,
                                                          Sistema.IdUsuario,
                                                          Sistema.IdModulo,
                                                          Sistema.UsaPlanoPatro,
                                                          Sistema.IdEmpresa) then

        MsgDlg( _LancDocCapCar.MessageInfo, 'Erro', mtError, [ mbok ], 0 );

     LimpaTela;
  end;
end;




procedure TFrmEstAdiantamentoMT.dbgrAdtoregularizadosTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  CdsAdtoRegularizados.IndexFieldNames := AFieldName;
end;

end.

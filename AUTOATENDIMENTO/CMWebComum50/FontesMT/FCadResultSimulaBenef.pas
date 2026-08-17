unit FCadResultSimulaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlResultSimulaBenef, uCtrlWebRegra, uCmTypes, dBaseDados, uSistema,
  FMsg;

const
  //Carriage Return
  CR = #13 + #10;

type
  TfrmCadResultSimulaBenef = class(TFrmCadastroMT)
    CdsIDRESULT: TFloatField;
    CdsTITULO: TStringField;
    CdsNOMEPARAREGRA: TStringField;
    CdsFLGATIVO: TFloatField;
    CdsFLGVISIVEL: TFloatField;
    CdsIDREGRA: TFloatField;
    lblIdInput: TLabel;
    lblTitulo: TLabel;
    lblNomeParaRegra: TLabel;
    dbedtIdResult: TDBEdit;
    dbedtTitulo: TDBEdit;
    dbedtNomeParaRegra: TDBEdit;
    dbchkFLGATIVO: TDBCheckBox;
    dbchkFLGVISIVEL: TDBCheckBox;
    lblIDREGRA: TLabel;
    msRegra: TMontaSelect;
    CdsTIPODADO: TStringField;
    CdsFORMATO: TStringField;
    lblTipoDado: TLabel;
    cmbTIPODADO: TComboBox;
    lblFormato: TLabel;
    dbedtFormato: TDBEdit;
    spbFormato: TSpeedButton;
    CdsORIGEMDADO: TStringField;
    CdsFLGQUERYPREENCHE: TFloatField;
    CdsQUERYPREENCHE: TBlobField;
    CdsCAMPO: TStringField;
    CdsVALORDEFAULT: TStringField;
    lblORIGEMDADO: TLabel;
    cmbORIGEMDADO: TComboBox;
    grpPreenchimento: TGroupBox;
    pnlDefault: TPanel;
    lblVALORDEFAULT: TLabel;
    dbedtVALORDEFAULT: TDBEdit;
    pnlQueryPreenche: TPanel;
    lblQUERYPREENCHE: TLabel;
    pnlRegra: TPanel;
    lblIDREGRAPREENCHE: TLabel;
    spbRegraPreenche: TSpeedButton;
    spbLimpaPreenche: TSpeedButton;
    edtNOMEREGRAPreenche: TEdit;
    dbchkFLGQUERYPREENCHE: TDBCheckBox;
    dbmemQUERYPREENCHE: TDBMemo;
    pnlCampo: TPanel;
    lblCAMPO: TLabel;
    dbedtCAMPO: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure spbFormatoClick(Sender: TObject);
    procedure cmbTIPODADOClick(Sender: TObject);
    procedure spbRegraPreencheClick(Sender: TObject);
    procedure cmbORIGEMDADOClick(Sender: TObject);
    procedure dbchkFLGQUERYPREENCHEClick(Sender: TObject);
  private
    ResultSimulaBenef : TCtrlResultSimulaBenef;
    WebRegra : TCtrlWebRegra;

    procedure MsgErro ( sMsg : String );
    function  Salva( bExclusao : boolean ) : boolean;
    procedure Reset;
    procedure SelecionaTipo;
    procedure SelecionaOrigem;

  public
    procedure Consulta( iId : integer );
  end;

var
  frmCadResultSimulaBenef: TfrmCadResultSimulaBenef;

implementation

{$R *.DFM}

{ TfrmCadResultSimulaBenef }

procedure TfrmCadResultSimulaBenef.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmCadResultSimulaBenef.Reset;
begin
  cmbORIGEMDADO.ItemIndex := -1;
  cmbTIPODADO.ItemIndex   := -1;

  edtNOMEREGRAPreenche.Clear;

  SelecionaOrigem;
  SelecionaTipo;

  Cds.Close;
  Cds.CreateDataSet;
end;



function TfrmCadResultSimulaBenef.Salva(bExclusao: boolean): boolean;
var
  iIdResult : integer;
begin
  Result := False;

  
  //Validação
  if not bExclusao then
  begin

    if cmbORIGEMDADO.ItemIndex = -1 then
    begin
      ShowMessage('O campo "Origem de Dado" não foi informado.');
      cmbORIGEMDADO.SetFocus;
      exit;
    end;

    if   ( cmbORIGEMDADO.ItemIndex = 0 )
     and ( Cds.FieldByName('CAMPO').IsNull ) then
    begin
      ShowMessage('O campo "Campo" não foi informado.');
      dbedtCAMPO.SetFocus;
      exit;
    end;

    if   ( cmbORIGEMDADO.ItemIndex = 1 )
     and ( Cds.FieldByName('IDREGRA').IsNull ) then
    begin
      ShowMessage('O campo "Regra" não foi informado.');
      edtNOMEREGRAPreenche.SetFocus;
      exit;
    end;

    if  ( cmbORIGEMDADO.ItemIndex = 0 )
     or ( cmbORIGEMDADO.ItemIndex = 1 ) then
    begin
      if   ( dbchkFLGQUERYPREENCHE.Checked )
       and ( Cds.FieldByName('QUERYPREENCHE').IsNull ) then
      begin
       ShowMessage('O campo "Query de Entrada" não foi informado.');
       dbmemQUERYPREENCHE.SetFocus;
       exit;
      end;
    end;

    if   ( cmbORIGEMDADO.ItemIndex = 2 )
     and ( Cds.FieldByName('VALORDEFAULT').IsNull ) then
    begin
      ShowMessage('O campo "Conteúdo Fixo" não foi informado.');
      dbedtVALORDEFAULT.SetFocus;
      exit;
    end;




    //Preparação
    if not ( cds.State in [dsInsert, dsEdit] ) then
      cds.Edit;

    Cds.FieldByName('TIPODADO').AsString := Copy( cmbTIPODADO.Text, 1, 1 );

    case cmbORIGEMDADO.ItemIndex of
      0 : Cds.FieldByName('ORIGEMDADO').AsString := 'C';
      1 : Cds.FieldByName('ORIGEMDADO').AsString := 'R';
      2 : Cds.FieldByName('ORIGEMDADO').AsString := 'V';
    end;

    cds.Post;


  end;

  Result := ResultSimulaBenef.GravaResultSimulaBenef( iIdResult );

  if Result and ( not bExclusao ) then
    Consulta( iIdResult );
end;

procedure TfrmCadResultSimulaBenef.FormCreate(Sender: TObject);
begin
  inherited;
  ResultSimulaBenef := TCtrlResultSimulaBenef.Create;
  ResultSimulaBenef.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebRegra := TCtrlWebRegra.Create;
  WebRegra.InitializeAs( ResultSimulaBenef );

  ResultSimulaBenef.CdsResultSimulaBenef := Cds;

  Reset;
end;

procedure TfrmCadResultSimulaBenef.FormDestroy(Sender: TObject);
begin
  ResultSimulaBenef.Free;
  WebRegra.Free;

  frmCadResultSimulaBenef := nil;

  inherited;    
end;

procedure TfrmCadResultSimulaBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
    Consulta( StrToInt( MontaSelect.ValoresChave[0] ) );
end;


procedure TfrmCadResultSimulaBenef.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadResultSimulaBenef.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( False );
end;

procedure TfrmCadResultSimulaBenef.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( False );
end;

procedure TfrmCadResultSimulaBenef.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( True );
  if Accept then Reset;
end;

procedure TfrmCadResultSimulaBenef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Reset;
  Cds.Insert;

  Cds.FieldByName('FLGATIVO').AsInteger         := 1;
  Cds.FieldByName('FLGVISIVEL').AsInteger       := 1;
  Cds.FieldByName('FLGQUERYPREENCHE').AsInteger := 0;
end;

procedure TfrmCadResultSimulaBenef.spbFormatoClick(Sender: TObject);
begin
  inherited;

  frmMsg := TfrmMsg.Create( Self );
  try
    frmMsg.Caption :='Formato';


    frmMsg.Memo.Text :=
     'O campo FORMATO define a aparência com que o campo irá ser exibido.                      ' + CR +
     'Os símbolos chaves que podem ser utilizados para formatar o campo são exibidos abaixo:   ' + CR +
     '                                                                                         ' + CR +
     'Número                                                                                   ' + CR +
     '------------                                                                             ' + CR +
     '   0         Dígito.   Se o valor a ser formatado possuir um dígito nesta posição, ele   ' + CR +
     '             será copiado. Caso não haja um dígito nesta posição, um "0" será inserido.  ' + CR +
     '                                                                                         ' + CR +
     '   #         Dígito.   Se o valor a ser formatado possuir um dígito nesta posição, ele   ' + CR +
     '             será copiado. Caso não haja um dígito nesta posição, não será inserido      ' + CR +
     '             nada.                                                                       ' + CR +
     '                                                                                         ' + CR +
     '   .         Ponto decimal. O primeiro caractere "." no formato determina o local do     ' + CR +
     '             separador decimal. Os demais caracteres "." encontrados são ignorados.      ' + CR +
     '                                                                                         ' + CR +
     '   ,         Separador de milhar. Se o formato possui um ou mais caraceteres ",", a      ' + CR +
     '             saída terá vírgulas separando cada grupço de três dígitos à esquerda do     ' + CR +
     '             ponto decimal.                                                              ' + CR +
     '                                                                                         ' + CR +
     '  E+         Notação científica. Se este símbolo for encontrado no formato, o número     ' + CR +
     '             será formatado utilizando notação científica.                               ' + CR +
     '                                                                                         ' + CR +
     '                                                                                         ' + CR +
     'Data/Hora                                                                                ' + CR +
     '------------                                                                             ' + CR +
     '   d         Exibe o dia como um número sem "0" precedendo-o.                            ' + CR +
     '   dd        Exibe o dia como um número com "0" precedendo-o.                            ' + CR +
     '   ddd       Exibe o dia com o nome abreviado.                                           ' + CR +
     '   dddd      Exibe o dia com o nome completo.                                            ' + CR +
     '   m         Exibe o mês como um número sem "0" precedendo-o.                            ' + CR +
     '   mm        Exibe o mês como um número com "0" precedendo-o.                            ' + CR +
     '   mmm       Exibe o mês com o nome abreviado.                                           ' + CR +
     '   mmmm      Exibe o mês com o nome completo.                                            ' + CR +
     '   yy        Exibe o ano como um número de dois dígitos.                                 ' + CR +
     '   yyyy      Exibe o ano como um número de quatro dígitos.                               ' + CR +
     '   h         Exibe a hora como um número sem "0" precedendo-o.                           ' + CR +
     '   hh        Exibe a hora como um número com "0" precedendo-o.                           ' + CR +
     '   n         Exibe os minutos como um número sem "0" precedendo-o.                       ' + CR +
     '   nn        Exibe os minutos como um número com "0" precedendo-o.                       ' + CR +
     '   s         Exibe os segundos como um número sem "0" precedendo-o.                      ' + CR +
     '   ss        Exibe os segundos como um número com "0" precedendo-o.                      ' + CR +
     '                                                                                         ' + CR +
     '                                                                                         ' + CR +
     'Todos                                                                                    ' + CR +
     '------------                                                                             ' + CR +
     '  ''xx''/"xx"  Caracteres entre aspas simples ou duplas são copiados tais quais aparecem ' + CR +
     '             no formato.                                                                 ' ; 

    frmMsg.ShowModal;
  finally
    frmMsg.Free;
  end;
end;

procedure TfrmCadResultSimulaBenef.cmbTIPODADOClick(Sender: TObject);
begin
  inherited;
  SelecionaTipo;
end;

procedure TfrmCadResultSimulaBenef.SelecionaTipo;
var
  bHabilita : boolean;
begin
  bHabilita := ( Copy( cmbTIPODADO.Text, 1, 1 ) = 'D' ) or
               ( Copy( cmbTIPODADO.Text, 1, 1 ) = 'N' );

  lblFormato.Visible   := bHabilita;
  dbedtFormato.Visible := bHabilita;
  spbFormato.Visible   := bHabilita;
end;

procedure TfrmCadResultSimulaBenef.Consulta(iId: integer);
var
  sAux : string;
begin
  Reset;

  Cds.Data := ResultSimulaBenef.SelecionaResultSimulaBenef( iId );

  sAux := cds.FieldByName('TIPODADO').AsString;
  if sAux = 'D' then sAux := 'Data';
  if sAux = 'N' then sAux := 'Número';
  if sAux = 'T' then sAux := 'Texto';
  cmbTIPODADO.ItemIndex   := cmbTIPODADO.Items.IndexOf( sAux );

  SelecionaTipo;

  sAux := cds.FieldByName('ORIGEMDADO').AsString;
  if sAux = 'C' then sAux := 'Campo de Query';
  if sAux = 'R' then sAux := 'Resultado de Regra';
  if sAux = 'V' then sAux := 'Conteúdo Fixo';
  cmbORIGEMDADO.ItemIndex := cmbORIGEMDADO.Items.IndexOf( sAux );

  SelecionaOrigem;

  if not cds.FieldByName('IDREGRA').IsNull then
  begin
    edtNOMEREGRAPreenche.Text := '[' + cds.FieldByName('IDREGRA').AsString +
     ']  ' + WebRegra.NomeRegra( cds.FieldByName('IDREGRA').AsInteger );
  end;

end;

procedure TfrmCadResultSimulaBenef.spbRegraPreencheClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
  begin
    msRegra.Executar;
    if msRegra.RetornouValor then
    begin
      Cds.FieldByName('IDREGRA').AsString := msRegra.ValoresChave[0];
      edtNOMEREGRAPreenche.Text := '[' + msRegra.ValoresChave[0] + ']  ' + msRegra.ValoresChave[1];
    end;
  end;
end;

procedure TfrmCadResultSimulaBenef.SelecionaOrigem;
begin
  pnlCampo.Visible         := False;
  pnlQueryPreenche.Visible := False;
  pnlRegra.Visible         := False;
  pnlDefault.Visible       := False;

  if cmbORIGEMDADO.ItemIndex = 0 then    //CAMPO DE QUERY
  begin
    pnlQueryPreenche.Visible := True;
    pnlCampo.Visible         := True;
  end;

  if cmbORIGEMDADO.ItemIndex = 1 then    //RESULTADO DE REGRA
  begin
    pnlQueryPreenche.Visible := True;
    pnlRegra.Visible         := True;
  end;

  if cmbORIGEMDADO.ItemIndex = 2 then    //VALOR DEFAULT
    pnlDefault.Visible       := True;
end;

procedure TfrmCadResultSimulaBenef.cmbORIGEMDADOClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigem;
end;

procedure TfrmCadResultSimulaBenef.dbchkFLGQUERYPREENCHEClick(
  Sender: TObject);
begin
  inherited;
  dbmemQUERYPREENCHE.Enabled := dbchkFLGQUERYPREENCHE.Checked;
end;

end.

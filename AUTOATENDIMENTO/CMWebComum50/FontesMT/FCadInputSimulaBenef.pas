unit FCadInputSimulaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCADASTROMT, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls, ComCtrls, uCmTypes, dBaseDados, uSistema, uCtrlInputSimulaBenef,
  JCLSysUtils, JCLStrings, uCtrlWebRegra, FMsg, FTelaAut;

const
  //Carriage Return
  CR = #13 + #10;

type
  TfrmCadInputSimulaBenef = class(TFrmCadastroMT)
    lblIdInput: TLabel;
    dbedtIdInput: TDBEdit;
    lblTitulo: TLabel;
    dbedtTitulo: TDBEdit;
    lblNomeParaRegra: TLabel;
    dbedtNomeParaRegra: TDBEdit;
    lblTipoDado: TLabel;
    cmbTIPODADO: TComboBox;
    dbchkFLGPODEALTERAR: TDBCheckBox;
    lblORIGEMDADO: TLabel;
    grpPreenchimento: TGroupBox;
    grpValidacao: TGroupBox;
    lblIDREGRAVALIDA: TLabel;
    lblQUERYVALIDA: TLabel;
    cmbORIGEMDADO: TComboBox;
    dbchkFLGQUERYVALIDA: TDBCheckBox;
    spbRegraValida: TSpeedButton;
    edtNOMEREGRAValida: TEdit;
    dbmemQUERYVALIDA: TDBMemo;
    pnlQueryPreenche: TPanel;
    lblQUERYPREENCHE: TLabel;
    dbchkFLGQUERYPREENCHE: TDBCheckBox;
    dbmemQUERYPREENCHE: TDBMemo;
    pnlDefault: TPanel;
    lblVALORDEFAULT: TLabel;
    dbedtVALORDEFAULT: TDBEdit;
    msRegra: TMontaSelect;
    dbchkFLGATIVO: TDBCheckBox;
    spbLimpaValida: TSpeedButton;
    pnlCampo: TPanel;
    lblCAMPO: TLabel;
    dbedtCAMPO: TDBEdit;
    pnlRegra: TPanel;
    lblIDREGRAPREENCHE: TLabel;
    edtNOMEREGRAPreenche: TEdit;
    spbRegraPreenche: TSpeedButton;
    spbLimpaPreenche: TSpeedButton;
    lblFormato: TLabel;
    dbedtFormato: TDBEdit;
    spbFormato: TSpeedButton;
    dbchkFLGVISIVEL: TDBCheckBox;
    pnlItems: TPanel;
    lbITENS: TListBox;
    Panel2: TPanel;
    spbPlus: TSpeedButton;
    spnMinus: TSpeedButton;
    Panel3: TPanel;
    spbUp: TSpeedButton;
    spbDown: TSpeedButton;
    pnlNovoItem: TPanel;
    edtNovoItem: TEdit;
    spbOkItem: TSpeedButton;
    spbCancelItem: TSpeedButton;
    CdsIDINPUT: TFloatField;
    CdsTITULO: TStringField;
    CdsNOMEPARAREGRA: TStringField;
    CdsFLGATIVO: TFloatField;
    CdsFLGVISIVEL: TFloatField;
    CdsTIPODADO: TStringField;
    CdsFORMATO: TStringField;
    CdsORIGEMDADO: TStringField;
    CdsIDREGRAPREENCHE: TFloatField;
    CdsFLGQUERYPREENCHE: TFloatField;
    CdsQUERYPREENCHE: TBlobField;
    CdsCAMPO: TStringField;
    CdsVALORDEFAULT: TStringField;
    CdsFLGPODEALTERAR: TFloatField;
    CdsIDREGRAVALIDA: TFloatField;
    CdsFLGQUERYVALIDA: TFloatField;
    CdsQUERYVALIDA: TBlobField;
    CdsLISTAITENS: TBlobField;
    CdsFLGREQUERIDO: TFloatField;
    dbchkFLGREQUERIDO: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure cmbORIGEMDADOClick(Sender: TObject);
    procedure spbRegraPreencheClick(Sender: TObject);
    procedure spbRegraValidaClick(Sender: TObject);
    procedure spbLimpaPreencheClick(Sender: TObject);
    procedure spbLimpaValidaClick(Sender: TObject);
    procedure dbchkFLGQUERYPREENCHEClick(Sender: TObject);
    procedure dbchkFLGQUERYVALIDAClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure spbFormatoClick(Sender: TObject);
    procedure cmbTIPODADOClick(Sender: TObject);
    procedure spnMinusClick(Sender: TObject);
    procedure spbPlusClick(Sender: TObject);
    procedure spbCancelItemClick(Sender: TObject);
    procedure spbOkItemClick(Sender: TObject);
    procedure edtNovoItemExit(Sender: TObject);
    procedure lbITENSDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbITENSDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure spbUpClick(Sender: TObject);
    procedure spbDownClick(Sender: TObject);
  private
    InputSimulaBenef : TCtrlInputSimulaBenef;
    WebRegra : TCtrlWebRegra;

    procedure MsgErro ( sMsg : String );
    function  Salva( bExclusao : boolean ) : boolean;
    procedure Reset;
    procedure SelecionaOrigem;
    procedure SelecionaTipo;
    procedure TrocaItem( a, b : integer );
    procedure MoveItem( iPosAtual, iPosNova : integer );

  public
    iIdInputInicial : integer;

    procedure Consulta( iId : integer );
  end;

var
  frmCadInputSimulaBenef: TfrmCadInputSimulaBenef;

implementation

{$R *.DFM}

{ TfrmCadInputSimulaBenef }

procedure TfrmCadInputSimulaBenef.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

function TfrmCadInputSimulaBenef.Salva( bExclusao : boolean ) : boolean;
var
  iIdInput, i : integer;
begin
  Result := False;

  if not bExclusao then
  begin

    //Validação
    if   ( cmbORIGEMDADO.ItemIndex = 1 )
     and ( Cds.FieldByName('CAMPO').IsNull ) then
    begin
      ShowMessage('O campo "Campo" não foi informado.');
      dbedtCAMPO.SetFocus;
      exit;
    end;


    if   ( cmbORIGEMDADO.ItemIndex = 2 )
     and ( Cds.FieldByName('IDREGRAPREENCHE').IsNull ) then
    begin
      ShowMessage('O campo "Regra" não foi informado.');
      edtNOMEREGRAPreenche.SetFocus;
      exit;
    end;

    if  ( cmbORIGEMDADO.ItemIndex = 1 )
     or ( cmbORIGEMDADO.ItemIndex = 2 ) then
    begin
      if   ( dbchkFLGQUERYPREENCHE.Checked )
       and ( Cds.FieldByName('QUERYPREENCHE').IsNull ) then
      begin
       ShowMessage('O campo "Query de Entrada" não foi informado.');
       dbmemQUERYPREENCHE.SetFocus;
       exit;
      end;
    end;

    if   ( cmbORIGEMDADO.ItemIndex = 3 )
     and ( Cds.FieldByName('VALORDEFAULT').IsNull ) then
    begin
      ShowMessage('O campo "Conteúdo Fixo" não foi informado.');
      dbedtVALORDEFAULT.SetFocus;
      exit;
    end;


    if dbchkFLGQUERYVALIDA.Checked then
    begin
      if Cds.FieldByName('IDREGRAVALIDA').IsNull then
      begin
       ShowMessage('O campo "Regra" não foi informado.');
       edtNOMEREGRAValida.SetFocus;
       exit;
      end;

      if Cds.FieldByName('QUERYVALIDA').IsNull then
      begin
       ShowMessage('O campo "Query de Entrada" não foi informado.');
       dbmemQUERYVALIDA.SetFocus;
       exit;
      end;

    end;

    if   ( Copy( cmbTIPODADO.Text, 1, 1 ) = 'L' )
     and ( lbITENS.Items.Count = 0 ) then
    begin
      ShowMessage('Pelo menos um item deve ser acrescentado à lista.');
      exit;
    end;


    //Preparação de campos
    if not ( cds.State in [dsInsert, dsEdit] ) then
      cds.Edit;

    Cds.FieldByName('TIPODADO').AsString   := Copy( cmbTIPODADO.Text,    1, 1 );

    case cmbORIGEMDADO.ItemIndex of
      1 : Cds.FieldByName('ORIGEMDADO').AsString := 'C';
      2 : Cds.FieldByName('ORIGEMDADO').AsString := 'R';
      3 : Cds.FieldByName('ORIGEMDADO').AsString := 'V';
    else
      Cds.FieldByName('ORIGEMDADO').Clear;
    end;

    if Copy( cmbTIPODADO.Text, 1, 1 ) = 'L' then
    begin
      Cds.FieldByName('LISTAITENS').Clear;
      for i := 0 to ( lbITENS.Items.Count - 1 ) do
      begin
        Cds.FieldByName('LISTAITENS').AsString := Cds.FieldByName('LISTAITENS').AsString + lbITENS.Items.Strings[i];
        if i < ( lbITENS.Items.Count - 1 ) then
          Cds.FieldByName('LISTAITENS').AsString := Cds.FieldByName('LISTAITENS').AsString + '#';
      end;
    end;

    cds.Post;
  end;

  Result := InputSimulaBenef.GravaInputSimulaBenef( iIdInput );

  if Result then Consulta( iIdInput );
end;

procedure TfrmCadInputSimulaBenef.FormCreate(Sender: TObject);
begin
  inherited;
  InputSimulaBenef := TCtrlInputSimulaBenef.Create;
  InputSimulaBenef.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebRegra := TCtrlWebRegra.Create;
  WebRegra.InitializeAs( InputSimulaBenef );

  InputSimulaBenef.CdsInputSimulaBenef := Cds;

  iIdInputInicial := 0;
  
  Reset;
end;

procedure TfrmCadInputSimulaBenef.FormDestroy(Sender: TObject);
begin
  InputSimulaBenef.Free;
  WebRegra.Free;

  frmCadInputSimulaBenef := nil;

  inherited;
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Consulta( StrToInt( MontaSelect.ValoresChave[0] ) );
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Reset;
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( False );
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( False );
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Salva( True );
  if Accept then Reset;
end;

procedure TfrmCadInputSimulaBenef.Reset;
begin
  cmbORIGEMDADO.ItemIndex := -1;
  cmbTIPODADO.ItemIndex   := -1;

  edtNOMEREGRAPreenche.Clear;
  edtNOMEREGRAValida.Clear;

  lbItens.Clear;

  SelecionaOrigem;
  SelecionaTipo;

  Cds.Close;
  Cds.CreateDataSet;
end;

procedure TfrmCadInputSimulaBenef.cmbORIGEMDADOClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigem;
end;

procedure TfrmCadInputSimulaBenef.SelecionaOrigem;
begin
  pnlCampo.Visible         := False;
  pnlQueryPreenche.Visible := False;
  pnlRegra.Visible         := False;
  pnlDefault.Visible       := False;

  if cmbORIGEMDADO.ItemIndex = 1 then    //CAMPO DE QUERY
  begin
    pnlQueryPreenche.Visible := True;
    pnlCampo.Visible         := True;
  end;

  if cmbORIGEMDADO.ItemIndex = 2 then    //RESULTADO DE REGRA
  begin
    pnlQueryPreenche.Visible := True;
    pnlRegra.Visible         := True;
  end;

  if cmbORIGEMDADO.ItemIndex = 3 then    //VALOR DEFAULT
    pnlDefault.Visible       := True;
end;

procedure TfrmCadInputSimulaBenef.spbRegraPreencheClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
  begin
    msRegra.Executar;
    if msRegra.RetornouValor then
    begin
      Cds.FieldByName('IDREGRAPREENCHE').AsString := msRegra.ValoresChave[0];
      edtNOMEREGRAPreenche.Text := '[' + msRegra.ValoresChave[0] + ']  ' + msRegra.ValoresChave[1];
    end;
  end;
end;

procedure TfrmCadInputSimulaBenef.spbRegraValidaClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
  begin
    msRegra.Executar;
    if msRegra.RetornouValor then
    begin
      Cds.FieldByName('IDREGRAVALIDA').AsString := msRegra.ValoresChave[0];
      edtNOMEREGRAValida.Text := '[' + msRegra.ValoresChave[0] + ']  ' + msRegra.ValoresChave[1];
    end;
  end;
end;

procedure TfrmCadInputSimulaBenef.spbLimpaPreencheClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
  begin
    Cds.FieldByName('IDREGRAPREENCHE').Clear;
    edtNOMEREGRAPreenche.Clear;
  end;
end;

procedure TfrmCadInputSimulaBenef.spbLimpaValidaClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsInsert, dsEdit] then
  begin
    Cds.FieldByName('IDREGRAVALIDA').Clear;
    edtNOMEREGRAValida.Clear;
  end;
end;

procedure TfrmCadInputSimulaBenef.dbchkFLGQUERYPREENCHEClick(
  Sender: TObject);
begin
  inherited;
  dbmemQUERYPREENCHE.Enabled := dbchkFLGQUERYPREENCHE.Checked;
end;

procedure TfrmCadInputSimulaBenef.dbchkFLGQUERYVALIDAClick(
  Sender: TObject);
begin
  inherited;
  dbmemQUERYVALIDA.Enabled := dbchkFLGQUERYVALIDA.Checked;
end;

procedure TfrmCadInputSimulaBenef.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Reset;
  Cds.Insert;

  Cds.FieldByName('FLGATIVO').AsInteger         := 1;
  Cds.FieldByName('FLGPODEALTERAR').AsInteger   := 1;
  Cds.FieldByName('FLGVISIVEL').AsInteger       := 1;
  Cds.FieldByName('FLGREQUERIDO').AsInteger     := 0;  
  Cds.FieldByName('FLGQUERYPREENCHE').AsInteger := 0;
  Cds.FieldByName('FLGQUERYVALIDA').AsInteger   := 0;
end;

procedure TfrmCadInputSimulaBenef.spbFormatoClick(Sender: TObject);
begin
  inherited;

  frmMsg := TfrmMsg.Create( Self );
  try
    frmMsg.Caption :='Formato';


    frmMsg.Memo.Text :=
     'O campo FORMATO define a aparência com que o campo irá ser exibido, caso seja do tipo    ' + CR +
     '"Data" ou "Número". Campos do tipo "Texto" ou "Lista" não são afetados pelo formato.     ' + CR +
     '                                                                                         ' + CR +     
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

procedure TfrmCadInputSimulaBenef.SelecionaTipo;
var
  bHabilita : boolean;
begin
  bHabilita := ( Copy( cmbTIPODADO.Text, 1, 1 ) = 'D' ) or
               ( Copy( cmbTIPODADO.Text, 1, 1 ) = 'N' );

  lblFormato.Visible   := bHabilita;
  dbedtFormato.Visible := bHabilita;
  spbFormato.Visible   := bHabilita;

  bHabilita := Copy( cmbTIPODADO.Text, 1, 1 ) = 'L';
  pnlItems.Visible   := bHabilita;
end;

procedure TfrmCadInputSimulaBenef.cmbTIPODADOClick(Sender: TObject);
begin
  inherited;
  SelecionaTipo;
end;

procedure TfrmCadInputSimulaBenef.spnMinusClick(Sender: TObject);
begin
  inherited;
  lbITENS.Items.Delete( lbITENS.ItemIndex );
end;

procedure TfrmCadInputSimulaBenef.spbPlusClick(Sender: TObject);
begin
  inherited;
  pnlNovoItem.Visible := True;
  edtNovoItem.SetFocus;
end;

procedure TfrmCadInputSimulaBenef.spbCancelItemClick(Sender: TObject);
begin
  inherited;
  edtNovoItem.Clear;
  pnlNovoItem.Visible := False;
end;

procedure TfrmCadInputSimulaBenef.spbOkItemClick(Sender: TObject);
begin
  inherited;
  if trim( edtNovoItem.Text ) <> '' then
  begin
    lbITENS.Items.Add( edtNovoItem.Text );
    edtNovoItem.Clear;
    pnlNovoItem.Visible := False;
  end;
end;

procedure TfrmCadInputSimulaBenef.edtNovoItemExit(Sender: TObject);
begin
  inherited;
  if edtNovoItem.Text <> '' then
    if MessageDlg('Acrescenta o novo item à lista?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    begin
      spbOkItemClick( nil );
      exit;
    end;

  spbCancelItemClick( nil );
end;

procedure TfrmCadInputSimulaBenef.lbITENSDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  Point: TPoint;
  i : integer;
begin
  inherited;
  if ( Sender = lbITENS ) and ( Source = lbITENS ) then
  begin
    Point.X := X;
    Point.Y := Y;

    i := lbITENS.ItemAtPos( Point, True );

    MoveItem( lbITENS.ItemIndex, i );

  end;
end;

procedure TfrmCadInputSimulaBenef.lbITENSDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := ( Source = lbITENS );
end;

procedure TfrmCadInputSimulaBenef.MoveItem(iPosAtual, iPosNova: integer);
var
  i, iMax : integer;
begin
  iMax := lbITENS.Items.Count - 1;

  if iPosNova = -1 then
  begin
    for i := iPosAtual to ( iMax - 1 ) do
      TrocaItem( i, i + 1 );
    lbITENS.ItemIndex := iMax;
    exit;
  end;

  if iPosNova < iPosAtual then
    for i := iPosAtual downto ( iPosNova + 1 ) do
      TrocaItem( i, i - 1 );

  if iPosNova > iPosAtual then
    for i := iPosAtual to ( iPosNova - 1 ) do
      TrocaItem( i, i + 1 );

  lbITENS.ItemIndex := iPosNova;
end;

procedure TfrmCadInputSimulaBenef.TrocaItem(a, b: integer);
var
  sAux : string;
begin
  sAux := lbITENS.Items.Strings[a];
  lbITENS.Items.Strings[a] := lbITENS.Items.Strings[b];
  lbITENS.Items.Strings[b] := sAux;
end;

procedure TfrmCadInputSimulaBenef.spbUpClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := lbITENS.ItemIndex;
  if i > 0 then
  begin
    TrocaItem( i, i - 1 );
    lbITENS.ItemIndex := i - 1;
  end;
end;

procedure TfrmCadInputSimulaBenef.spbDownClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  i := lbITENS.ItemIndex;
  if   ( i >= 0 )
   and ( i < ( lbITENS.Items.Count - 1 ) ) then
  begin
    TrocaItem( i, i + 1 );
    lbITENS.ItemIndex := i + 1;
  end;
end;

procedure TfrmCadInputSimulaBenef.Consulta(iId: integer);
var
  sAux : String;
  iPos : integer;
begin
  Reset;

  Cds.Data := InputSimulaBenef.SelecionaInputSimulaBenef( iId );

  sAux := cds.FieldByName('TIPODADO').AsString;
  if sAux = 'D' then sAux := 'Data';
  if sAux = 'N' then sAux := 'Número';
  if sAux = 'T' then sAux := 'Texto';
  if sAux = 'L' then sAux := 'Lista';
  cmbTIPODADO.ItemIndex   := cmbTIPODADO.Items.IndexOf( sAux );

  SelecionaTipo;

  sAux := cds.FieldByName('ORIGEMDADO').AsString;
  if sAux = 'C' then sAux := 'Campo de Query';
  if sAux = 'R' then sAux := 'Resultado de Regra';
  if sAux = 'V' then sAux := 'Conteúdo Fixo';
  if sAux <> '' then cmbORIGEMDADO.ItemIndex := cmbORIGEMDADO.Items.IndexOf( sAux );

  SelecionaOrigem;

  if not cds.FieldByName('IDREGRAPREENCHE').IsNull then
  begin
    edtNOMEREGRAPreenche.Text := '[' + cds.FieldByName('IDREGRAPREENCHE').AsString +
     ']  ' + WebRegra.NomeRegra( cds.FieldByName('IDREGRAPREENCHE').AsInteger );
  end;

  if not cds.FieldByName('IDREGRAVALIDA').IsNull then
  begin
    edtNOMEREGRAValida.Text := '[' + cds.FieldByName('IDREGRAVALIDA').AsString +
     ']  ' + WebRegra.NomeRegra( cds.FieldByName('IDREGRAVALIDA').AsInteger );
  end;

  if not cds.FieldByName('LISTAITENS').IsNull then
  begin
    sAux := trim( Cds.FieldByName('LISTAITENS').AsString );
    while sAux <> '' do
    begin
      iPos := StrFind( '#', sAux, 1 );
      if iPos <> 0 then
      begin
        lbITENS.Items.Add( StrLeft( sAux, iPos - 1 ) );
        sAux := StrRight( sAux, length( sAux ) - iPos );
      end
      else
      begin
        lbITENS.Items.Add( sAux );
        sAux := '';
      end;
    end;
  end;
end;

end.

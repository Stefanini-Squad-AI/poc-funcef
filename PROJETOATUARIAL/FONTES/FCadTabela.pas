unit FCadTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, DBCtrls, Mask, wwdbedit, ComCtrls, StdCtrls, wwdblook,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmCadTbCampos = class(TfrmCadastroCS)
    Label1: TLabel;
    dbeditgrupo: TwwDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label9: TLabel;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Soleitura: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    qrygrupo: TwwQuery;
    qryCampos: TwwQuery;
    Updqrycampos: TUpdateSQL;
    qryaux: TwwQuery;
    dbeAvaliacao: TwwDBEdit;
    dbeTabela: TwwDBEdit;
    dbeDataCriacao: TwwDBEdit;
    dbeIdTabela: TwwDBEdit;
    dbeMassaPlano: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    procedure Atualizar(const lIdTabela: LongInt);
  protected
  public
    { Public declarations }
    function GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
			   tipocampo : integer;posicaocampo : string) : boolean;
    function DeletarRegistros(idtabela : integer): boolean;
  end;

var
  frmCadTbCampos: TfrmCadTbCampos;

implementation
uses  UMensErro,UDataBase ,UBibliotecaAtuarial,usistema, UGrupoHipotese,
      RelatErro,DBaseDados, uAutorizacao,faguarde;

{$R *.DFM}

procedure TfrmCadTbCampos.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if montaselect.RetornouValor then
  begin
    dbeditgrupo.Text := qrygrupo['CODGRUPOARQUIVO'];
    Atualizar(StrToInt(montaselect.ValoresChave[0]));
  end;
end;

function   TfrmCadTbCampos.GravaTabCampo(idtab : integer;codigocampo,descricaocampo : string;
				      tipocampo : integer;posicaocampo : string): boolean;
begin
    qrycampos.insert;
    qrycampos.fieldbyname('IDCAMPO').asstring   := codigocampo;
    qrycampos.fieldbyname('IDTABELA').asinteger  := idtab;
    qrycampos.fieldbyname('DESCRICAO').asstring := descricaocampo;
    qrycampos.fieldbyname('TIPO').asinteger     := tipocampo;
    qrycampos.fieldbyname('RELACAO').asstring   := posicaocampo;
    qrycampos.Post;
    try
      AplicaAlteracoes([qrycampos]);
    except
      raise;
    end;
    GravaTabCampo := true;
end;

procedure TfrmCadTbCampos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('DATACRIACAO').asdatetime := date;
  qry.FieldByName('MASSAPLANO').asstring := qryGrupo['CODGRUPOARQUIVO'];
  dbeditgrupo.SetFocus;
end;

procedure TfrmCadTbCampos.Atualizar(const lIdTabela: LongInt);
begin
  with qry do
  begin
    Close;
    ParamByName('pIDTABELA').AsInteger := lIdTabela;
    Open;
  end;
  with qrycampos do
  begin
     close;
     parambyname('codtab').asinteger:=lIdtabela;
     open;
  end;
end;

procedure TfrmCadTbCampos.FormCreate(Sender: TObject);
begin
  inherited;
  Atualizar(-1);
  qryGrupo.Open;
end;

procedure TfrmCadTbCampos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryGrupo.Close;
end;

procedure TfrmCadTbCampos.CmeCadastroConfirma(Sender: TObject);
begin

  if qry.State = dsInsert then
  begin

    if (Trim(Qry.FieldByName('AVALIACAO').AsString) = '') or
       (Trim(Qry.FieldByName('DESCRICAO').AsString) = '') then
    begin
       ShowMessage('Campos Obrigatórios não Preenchidos !');
       Exit;
    end;

    FazQuery(QryAux,'SELECT DESCRICAO FROM '+sistema.PrefixoServidor+
    'TBPARTICIP WHERE DESCRICAO = '''+Qry.FieldByName('DESCRICAO').AsString+'''');

    // Caso Já Existe dá Erro
    if not QryAux.IsEmpty Then
    begin
      ShowMessage('Descrição de tabela já existe.');
      exit;
    end;

    qry.FieldByName('IDTABELA').AsInteger := LeUltRegistro(qry, 'TBPARTICIP');

    inherited;

    qrycampos.close;
    qrycampos.Params[0].asinteger:= qry.fieldbyname('idtabela').asinteger;
    qrycampos.open;

    if not qrycampos.IsEmpty Then
    begin
      ShowMessage('Já existem campos relacionados à esta tabela.');
      exit;
    end;

    if QryGrupo['CODGRUPOARQUIVO'] = 'ADPREF' then
    begin
       GravaTabCampo(qry['IDTABELA'],'DATAINSC','Data de início de inscrição',3,'V1');
       GravaTabCampo(qry['IDTABELA'],'IDPESSOA','Identificação do participante no sistema',1,'V2');
       GravaTabCampo(qry['IDTABELA'],'IDPESSJUR','Código da patrocinadora',1,'V3');
       GravaTabCampo(qry['IDTABELA'],'IDPLANOPREV','Identifição do plano previdenciário',1,'V4');
       GravaTabCampo(qry['IDTABELA'],'SALPARTIC','Salário de participação',1,'V5');
       GravaTabCampo(qry['IDTABELA'],'SITPARDESC','Código da situação do participante',1,'V6');
       GravaTabCampo(qry['IDTABELA'],'IDSITPART','Código da situação do participante no plano',1,'V7');
       GravaTabCampo(qry['IDTABELA'],'DATAMANUT','Data de início de manutenção',3,'V8');
       GravaTabCampo(qry['IDTABELA'],'DATACANCELA','Data de cancelamento',3,'V9');
       GravaTabCampo(qry['IDTABELA'],'DATAADMISSAO','Data de admissão na patrocinadora',3,'V10');
       GravaTabCampo(qry['IDTABELA'],'DATANASC','Data de nascimento do participante',3,'V11');
       GravaTabCampo(qry['IDTABELA'],'ESTCIVIL','Estado civil',2,'V12');
       GravaTabCampo(qry['IDTABELA'],'SEXO','Sexo',2,'V13');
       GravaTabCampo(qry['IDTABELA'],'CPF','CPF do participante',2,'V14');
       GravaTabCampo(qry['IDTABELA'],'MATRICULA','Matrícula do participante na fundação',1,'V15');
       GravaTabCampo(qry['IDTABELA'],'IDSITFUNC','Código de situação na patrocinadora',1,'V16');
       GravaTabCampo(qry['IDTABELA'],'DATADEMISSAO','Data de demissão na patrocinadora',3,'V17');
       GravaTabCampo(qry['IDTABELA'],'TEMPOSERVANT','Tempo de serviço anterior a patrocinadora',1,'V18');
       GravaTabCampo(qry['IDTABELA'],'SALTOTAL','Salário do participante na patrocinadora',1,'V19');
       GravaTabCampo(qry['IDTABELA'],'IDGRUPO','Grupo da empresa patrocinadora',2,'V20');
       GravaTabCampo(qry['IDTABELA'],'DIBINSS','Data de início de benefício pelo INSS',3,'V21');
       GravaTabCampo(qry['IDTABELA'],'DIBREFER','Data de início de benefício pela REFER',3,'V22');
       GravaTabCampo(qry['IDTABELA'],'DATAFIMBENE','Data fim de benefício',3,'V23');
       GravaTabCampo(qry['IDTABELA'],'BENEREFER','Valor do benefício REFER',1,'V24');
       GravaTabCampo(qry['IDTABELA'],'BENEINSS','Valor do benefício INSS',1,'V25');
       GravaTabCampo(qry['IDTABELA'],'IDBENEFICIO','Código do tipo de benefício concedido',1,'V26');
       GravaTabCampo(qry['IDTABELA'],'IDSITBENEF','Código da situação do benefício',1,'V27');
       GravaTabCampo(qry['IDTABELA'],'SALPARLIM','Salário de participação sem limite',1,'V28');
       GravaTabCampo(qry['IDTABELA'],'SALREALB','Salário Real de Benefício',1,'V29');
       GravaTabCampo(qry['IDTABELA'],'CONTRIBD','Valor da contribuição do participante',1,'V30');
       GravaTabCampo(qry['IDTABELA'],'JOIAD','Valor da jóia do participante',1,'V31');
       GravaTabCampo(qry['IDTABELA'],'PCONTRIBD','Valor da contribuição da patrocinadora',1,'V32');
       GravaTabCampo(qry['IDTABELA'],'RESERVAP','Reserva de poupança do participante',1,'V33');
     end; {ativos e assstidos REFER}

     if QryGrupo['CODGRUPOARQUIVO'] = 'ADDREF' then
     begin
       GravaTabCampo(qry['IDTABELA'],'DRMATTIT','Matrícula do participante titular',1,'V1');
       GravaTabCampo(qry['IDTABELA'],'DRMATDEP','Matrícula do dependente',1,'V2');
       GravaTabCampo(qry['IDTABELA'],'DRNASC','Data de nascimento do dependente',3,'V3');
       GravaTabCampo(qry['IDTABELA'],'DRSEXO','Sexo do dependente',2,'V4');
       GravaTabCampo(qry['IDTABELA'],'DRVINC','Código do vínculo do dependente com o participante',2,'V5');
       GravaTabCampo(qry['IDTABELA'],'DRTIPO','Código da situação do dependente',2,'V6');
       GravaTabCampo(qry['IDTABELA'],'DRPATRO','Código da patrocinadora',1,'V7');
     end;

   end;

end;

procedure TfrmCadTbCampos.CmeCadastroDelete(Sender: TObject);
begin

  with TwwQuery.Create(Self) do begin
    databasename := qry.DatabaseName;
    Sql.Add('SELECT DISTINCT IDTABELA FROM TBVALPART ');
    Sql.Add('WHERE (IDTABELA = ' + inttostr(qry['IdTabela']) + ')');
    try
      Open;
      if recordcount > 0 then begin
	MsgDlg('Atenção! Existem valores relacionados a esta tabela.' + #10 + #13 +
		'Desfaça a ''Geração de Valores'' antes de apagá-la!', 'Erro', mtError, [mbOK], 0);
	exit;
      end;
      close;
     except
      MsgDlg('Problemas com a tabela de valores.', 'Erro', mtError, [mbOK], 0);
      exit;
    end;
    Free;
  end;

  deletarregistros(qry.fieldbyname('idtabela').asinteger);

  inherited;
end;

function TfrmCadTbCampos.DeletarRegistros(idtabela : integer): boolean;
begin
 DeletarRegistros := true;

 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBCAMPOPART '+
	     'WHERE IDTABELA  = '+IntToStr(IDTABELA)) then begin
    MsgDlg('Erro na Tabela de Campos dos Participantes.', 'Erro', mtError, [mbOk],0);
    DeletarRegistros := false;
 end;

 if not ExecutaQuery(QryAux,'DELETE '+sistema.PrefixoServidor+'TBPARTICIP '+
		     'WHERE IDTABELA  = '+IntToStr(idtabela)) then
 begin
   MsgDlg('Erro na Tabela de Participantes', 'Erro', mtError, [mbOk],0);
   DeletarRegistros := false;
 end;

end;

end.

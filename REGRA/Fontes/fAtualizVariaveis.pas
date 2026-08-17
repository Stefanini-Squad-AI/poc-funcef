unit fAtualizVariaveis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwdatsrc, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls;

type
  TfrmAtualizVariaveis = class(TfrmOkCancelar)
    QryCmpBd: TwwQuery;
    UpdCmpBd: TUpdateSQL;
    QryPassos: TwwQuery;
    UpdPassos: TUpdateSQL;
    QryPassosIDREGRA: TFloatField;
    QryPassosIDCAMPO: TStringField;
    QryPassosIDCAMPO2: TStringField;
    QryPassosDESCRICAOALGORIT: TStringField;
    rchedLista: TRichEdit;
    QryInsert: TwwQuery;
    QryCmpBdIDCAMPO: TStringField;
    QryCmpBdENTIDADE: TStringField;
    QryCmpBdNOMEDOCAMPO: TStringField;
    QryCmpBdDESCRICAODOCAMPO: TStringField;
    QryCmpBdCAMPODOBANCO: TFloatField;
    QryCmpBdCHAVE: TFloatField;
    QryCmpBdFLGOBRIGATORIO: TFloatField;
    QryCmpBdAPELIDO: TStringField;
    QryCmpBdIDTIPODADO: TFloatField;
    QryPassosIDALGORITMODAREG: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function RefazTexto(texto, cmp1 : String) : String;
    procedure bbtnCancelarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizVariaveis: TfrmAtualizVariaveis;

implementation

uses fAguarde, dBaseDados;

{$R *.DFM}

procedure TfrmAtualizVariaveis.FormShow(Sender: TObject);
begin
  inherited;
  rchedLista.Lines.Clear;

end;

procedure TfrmAtualizVariaveis.bbtnConfirmarClick(Sender: TObject);
var
   vDesc, vSql, vIdCampo, vEntidade, vNomedoCampo, vDescricaodoCampo, vApelido : String;
   vIdRegra, vPasso, vCampodoBanco, vChave, vFlgObrigatorio, vIdTipoDado : LongInt;
begin
  inherited;

  if MessageDlg('Atualizar variaveis minusculas ?',  mtConfirmation, [mbYes, mbNo], 0) = mrNO then
        Exit;

  rchedLista.Lines.Clear;

  frmAguarde.Mostra('Abrindo Tabelas ...');
  frmAguarde.Refresh;

  QryCmpBd.Open;
  QryPassos.Open;
  //Inicia inclusão de variaveis Maiusculas

  if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

  frmAguarde.Mostra('Incluindo as maiusculas ...');
  frmAguarde.Refresh;

  QryCmpBd.First;
  rchedLista.Lines.Add('INCLUSÃO DE VARIAVEIS MAIUSCULAS');
  rchedLista.Lines.Add('');
  while not QryCmpBd.Eof do begin
        vIdCampo     := UpperCase(QryCmpBd.FieldbyName('IDCAMPO').AsString);
        vEntidade    := QryCmpBd.FieldbyName('ENTIDADE').AsString;
        vNomedoCampo := QryCmpBd.FieldbyName('NOMEDOCAMPO').AsString;
        vApelido     := QryCmpBd.FieldbyName('APELIDO').AsString;
        vChave       := QryCmpBd.FieldbyName('CHAVE').AsInteger;
        vIdTipoDado  := QryCmpBd.FieldbyName('IDTIPODADO').AsInteger;
        vCampodoBanco     := QryCmpBd.FieldbyName('CAMPODOBANCO').AsInteger;
        vDescricaodoCampo := QryCmpBd.FieldbyName('DESCRICAODOCAMPO').AsString;
        vFlgObrigatorio   := QryCmpBd.FieldbyName('FLGOBRIGATORIO').AsInteger;

        with QryInsert do begin
             Close;
             Sql.Clear;
             vSql :=   'INSERT INTO CMPBD (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, CAMPODOBANCO, '+
                       'CHAVE, FLGOBRIGATORIO, APELIDO, IDTIPODADO) VALUES ('+
                       ''''+vIdCampo+''', '+
                       ''''+vEntidade+''', '+
                       ''''+vNomedoCampo+''', '+
                       ''''+vDescricaodoCampo+''', '+
                       ''''+InttoStr(vCampodoBanco)+''', '+
                       ''''+InttoStr(vChave)+''', '+
                       ''''+InttoStr(vFlgObrigatorio)+''', '+
                       ''''+vApelido+''', '+
                       ''''+InttoStr(vIdTipoDado)+''')';
             Sql.Add(vSql);
             try
                ExecSql;
             except
                rchedLista.Lines.Add('Registro '+vIdCampo+' já cadastrado.');
             end;
        end;
        QryCmpBd.Next;
  end;


  //Alteração das variaveis utilizadas pelos passos das regras
  frmAguarde.Mostra('Alterando as minusculas dos passos ...');
  frmAguarde.Refresh;

  rchedLista.Lines.Add('ALTERAÇÃO DAS VARIAVEIS MINUSCULAS UTILIZADAS PELOS PASSOS DAS REGRAS PARA MAIUSCULAS');
  rchedLista.Lines.Add('');

  with QryPassos do begin
        Close;
        Open;
        First;
  end;

  while not QryPassos.Eof do begin
        if QryCmpBd.Locate('IDCAMPO',QryPassos.FieldbyName('IDCAMPO').AsString,[]) then begin
           vDesc := RefazTexto(QryPassos.FieldbyName('DESCRICAOALGORIT').AsString, QryPassos.FieldbyName('IDCAMPO').AsString);
           vIdRegra := QryPassos.FieldbyName('IDREGRA').AsInteger;
           vPasso := QryPassos.FieldbyName('IDALGORITMODAREG').AsInteger;
           with QryInsert do begin
                Close;
                Sql.Clear;
                vSql := 'UPDATE ALGREGRA SET'+
                        ' IDCAMPO = UPPER(IDCAMPO),'+
                        ' DESCRICAOALGORIT = '''+vDesc+''''+
                        ' WHERE IDREGRA = '+InttoStr(vIdRegra)+
                        ' AND  IDALGORITMODAREG = '+InttoStr(vPasso);
                Sql.Add(vSql);
                try
                        ExecSql;
                except
                    rchedLista.Lines.Add( 'Ocorreu um erro na alteração para maiusculo (1) da regra/passo '+
                                          InttoStr(vIdRegra)+'/'+InttoStr(vPasso));
                end;
           end;
        end;
        if QryCmpBd.Locate('IDCAMPO',QryPassos.FieldbyName('IDCAMPO2').AsString,[]) then begin
           vDesc := RefazTexto(QryPassos.FieldbyName('DESCRICAOALGORIT').AsString, QryPassos.FieldbyName('IDCAMPO2').AsString);
           vIdRegra := QryPassos.FieldbyName('IDREGRA').AsInteger;
           vPasso := QryPassos.FieldbyName('IDALGORITMODAREG').AsInteger;
           with QryInsert do begin
                Close;
                Sql.Clear;
                vSql := 'UPDATE ALGREGRA SET'+
                        ' IDCAMPO2 = UPPER(IDCAMPO2), '+
                        ' DESCRICAOALGORIT = '''+vDesc+''''+
                        ' WHERE IDREGRA = '+InttoStr(vIdRegra)+
                        ' AND IDALGORITMODAREG = '+InttoStr(vPasso);
                Sql.Add(vSql);
                try
                        ExecSql;
                except
                    rchedLista.Lines.Add( 'Ocorreu um erro na alteração para maiusculo (2) da regra/passo '+
                                          InttoStr(vIdRegra)+'/'+InttoStr(vPasso));
                end;
           end;
        end;
        QryPassos.Next;
  end;

  frmAguarde.Mostra('Excluindo minusculas (CMPBD) ...');
  frmAguarde.Refresh;

  rchedLista.Lines.Add('EXCLUSÃO DAS VARIAVEIS MINUSCULAS DA TABELA DE VARIAVEIS (CMPBD)');
  rchedLista.Lines.Add('');

  QryCmpBd.First;
  while not QryCmpBd.Eof do begin
        with QryInsert do begin
                Close;
                Sql.Clear;
                vSql := 'DELETE CMPBD WHERE (CAMPODOBANCO = 0) AND (IDCAMPO = LOWER(IDCAMPO)) AND '+
                        '(IDCAMPO='''+QryCmpBd.FieldbyName('IDCAMPO').AsString+''') OR '+
                        '(IDCAMPO = INITCAP(LOWER(IDCAMPO)) AND IDCAMPO <> UPPER(IDCAMPO) AND '+
                        '(IDCAMPO='''+QryCmpBd.FieldbyName('IDCAMPO').AsString+'''))';
                Sql.Add(vSql);
                try
                        ExecSql;
                except
                    rchedLista.Lines.Add( 'Ocorreu um erro na exclusão da variavel (CMPBD) '+
                                          QryCmpBd.FieldbyName('IDCAMPO').AsString);
                end;
        end;
        QryCmpBd.Next;
  end;


  frmAguarde.Mostra('Atualizando Formulas ...');
  frmAguarde.Refresh;

  rchedLista.Lines.Add('ALTERAÇÃO DAS FORMULAS QUE SOMENTE UTILIZAM EXPRESSAOFORMULA PARA EXPRESSAOREAL');
  rchedLista.Lines.Add('');

  with QryInsert do begin
       Close;
       Sql.Clear;
       vSql := 'UPDATE FORMULA SET EXPRESSAOREAL=EXPRESSAOFORMULA '+
               '           WHERE   EXPRESSAOREAL IS NULL';
       Sql.Add(vSql);
       try
          ExecSql;
       except
             rchedLista.Lines.Add( 'Ocorreu um erro na alteração da formula');
       end;
  end;
  
  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

  frmAguarde.Apaga;
end;

procedure TfrmAtualizVariaveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCmpBd.Close;
  QryPassos.Close;
end;


function TfrmAtualizVariaveis.RefazTexto(texto, cmp1 : String) : String;
var
    vTst, vDesc, vNum1, vNew, vNumNew : String;
    i, vTamDesc, vTam1 : LongInt;
begin
        vDesc := Texto;
        vNum1 := ' '+cmp1+' ';
        vTam1 := Length(vNum1);
        vNew := vDesc;
        vTamDesc := Length(vNew);

        if cmp1 <> '' then begin
                for i :=1 to vTamDesc do begin
                        vTst := Copy(vNew,i,vTam1);
                        if (vTst = vNum1) and (vNum1 <> '') then begin
                                vNumNew := ' '+UpperCase(trim(cmp1))+' ';
                                vNew := Copy(vNew,1,i-1)+vNumNew+Copy(vNew,i+Length(vNum1),Length(vNew));
                        end;
                end;
        end;
        Result := vNew;
end;

procedure TfrmAtualizVariaveis.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;
end;

end.
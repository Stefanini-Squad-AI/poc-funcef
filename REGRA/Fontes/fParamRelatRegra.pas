unit fParamRelatRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, Buttons, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamRelatRegra = class(TfrmOkCancelar)
    ms2: TMontaSelect;
    ms3: TMontaSelect;
    ms1: TMontaSelect;
    GroupBox4: TGroupBox;
    lstDados: TListBox;
    sbtnApagar: TSpeedButton;
    lstId: TListBox;
    ms4: TMontaSelect;
    sbtnUmaUm: TSpeedButton;
    btnSelecionar: TBitBtn;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnUmaUmClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }         
  end;

var
  frmParamRelatRegra: TfrmParamRelatRegra;
  vSql1, vSql2, vSql3, vSql4 : String;

implementation

uses dRelRegra, dRelDetalhes, uSistema, uMensErro, fAguarde;

{$R *.DFM}



procedure TfrmParamRelatRegra.bbtnConfirmarClick(Sender: TObject);
var
   vAux : String;
   i : LongInt;
begin
  inherited;
  vAux := '';
  Case TipoRel of
       1 : begin
                if LstId.Items.Count > 0 then begin
                   vAux := '';
                   For i := 0 to lstId.Items.Count - 1 do
                       vAux := vAux + lstId.Items[i]+',';
                   vAux := Copy(vAux,1,Length(vAux)-1)+') AND ';
                   vSql1 := 'SELECT F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, G.DESCGRUPOFORMULA '+
                            'FROM GRPFORMULA G, FORMULA F WHERE F.IDFORMULA IN ('+vAux+
                            ' G.CODGRUPOFORMULA = F.CODGRUPOFORMULA ORDER BY '+
                            'G.DESCGRUPOFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL';
                end else
                    vSql1 := 'SELECT F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, G.DESCGRUPOFORMULA '+
                             'FROM GRPFORMULA G, FORMULA F WHERE G.CODGRUPOFORMULA = F.CODGRUPOFORMULA ORDER BY '+
                             'G.DESCGRUPOFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL';
                with dtmRelRegra.QryFormula do begin
                     Close;
                     Sql.Clear;
                     Sql.Add(vSql1);
                     Open;
                end;
           end;
       2 : begin
                  if lstId.Items.Count > 0 then begin
                     vAux := '';
                     For i := 0 to lstId.Items.Count - 1 do
                         vAux := vAux + ''''+lstId.Items[i]+''',';
                     vAux := ' IDCAMPO IN ('+Copy(vAux,1,Length(vAux)-1)+')';
                     vSql2 := 'SELECT IDCAMPO, DESCRICAODOCAMPO FROM CMPBD WHERE CAMPODOBANCO = 0 AND '+
                              vAux+' ORDER BY IDCAMPO';
                  end else
                      vSql2 := 'SELECT IDCAMPO, DESCRICAODOCAMPO FROM CMPBD WHERE CAMPODOBANCO = 0 ORDER BY IDCAMPO';
                  with dtmRelRegra.qryVariaveis do begin
                       Close;
                       Sql.Clear;
                       Sql.Add(vSql2);
                       Open;
                  end;
           end;
       3 : begin
                if lstId.Items.Count > 0 then begin
                   vAux := '';
                   For i := 0 to lstId.Items.Count - 1 do
                       vAux := vAux + ''''+lstId.Items[i]+''',';
                   vAux := ' IDCAMPO IN ('+Copy(vAux,1,Length(vAux)-1)+')';
                   vSql3 := 'SELECT IDCAMPO, DESCRICAODOCAMPO,ENTIDADE,NOMEDOCAMPO FROM CMPBD '+
                            'WHERE CAMPODOBANCO > 0 AND '+vAux+' ORDER BY ENTIDADE, NOMEDOCAMPO';
                end else
                    vSql3 := 'SELECT IDCAMPO, DESCRICAODOCAMPO,ENTIDADE,NOMEDOCAMPO FROM CMPBD '+
                             'WHERE CAMPODOBANCO > 0 ORDER BY ENTIDADE, NOMEDOCAMPO';
                with dtmRelRegra.qryCampos do begin
                     Close;
                     Sql.Clear;
                     Sql.Add(vSql3);
                     Open;
                end;
           end;
       4 : begin
                if LstId.Items.Count > 0 then begin
                   vAux := '';
                   For i := 0 to lstId.Items.Count - 1 do
                       vAux := vAux + lstId.Items[i]+',';
                   vAux := Copy(vAux,1,Length(vAux)-1)+')';
                   vSql4 := 'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, A.IDALGORITMODAREG, '+
                            'A.DESCRICAOALGORIT FROM REGRA R, ALGREGRA A, TIPOREGRA T WHERE '+
                            '(R.IDREGRA = A.IDREGRA) AND (T.IDTIPOREGRA = R.IDTIPOREGRA) AND (R.IDREGRA IN ('+
                            vAux+') ORDER BY T.DESCREGRA, R.NOMEREGRA, R.IDREGRA, A.IDALGORITMODAREG';
                end else
                    vSql4 := 'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, T.IDGRUPOREGRA, '+
                             'A.IDALGORITMODAREG, A.DESCRICAOALGORIT FROM REGRA R, ALGREGRA A, '+
                             'TIPOREGRA T, GRUPOREGRAUSUARIO G WHERE (R.IDREGRA = A.IDREGRA) AND '+
                             '(T.IDTIPOREGRA = R.IDTIPOREGRA) AND (T.IDGRUPOREGRA = G.IDGRUPOREGRA) AND '+
                             '(G.IDUSUARIO = '+InttoStr(Sistema.IdUsuario)+') ORDER BY T.DESCREGRA, R.NOMEREGRA, R.IDREGRA, '+
                             'A.IDALGORITMODAREG';
                with dtmRelRegra.QryRegras do begin
                     Close;
                     Sql.Clear;
                     Sql.Add(vSql4);
                     Open;
                end;

           end;
  end;
end;

procedure TfrmParamRelatRegra.btnSelecionarClick(Sender: TObject);
var
   vId : LongInt;
begin
  inherited;
  Case TipoRel of
       1 : begin
                  ms1.Executar;
                  if ms1.RetornouValor then begin
                    lstDados.Items.Add(ms1.ValoresChave[0]+'-'+ms1.ValoresChave[1]);
                    lstId.Items.Add(ms1.ValoresChave[0]);
                  end;
           end;
       2 : begin
                ms2.Executar;
                if ms2.RetornouValor then begin
                   lstDados.Items.Add(ms2.ValoresChave[0]+'-'+ms2.ValoresChave[1]);
                   lstId.Items.Add(ms2.ValoresChave[0]);
                end;
           end;
       3 : begin
                ms3.Executar;
                if ms3.RetornouValor then begin
                   lstDados.Items.Add(ms3.ValoresChave[0]+'-'+ms3.ValoresChave[1]);
                   lstId.Items.Add(ms3.ValoresChave[0]);
                end;
           end;
       4 : begin // Regras
                ms4.Executar;
                if ms4.RetornouValor then begin
                   try
                     vId := StrtoInt(Ms4.ValoresChave[2]);
                   except
                     vId := 0;
                   end;
                   with dtmRelDetalhes.QryPermissao do begin
                        Close;
                        ParambyName('GRUPO').AsInteger := vId;
                        ParambyName('USUARIO').AsInteger := Sistema.IdUsuario;
                        Open;
                   end;
                   if dtmRelDetalhes.QryPermissao.IsEmpty then begin
                      MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
                      frmAguarde.Apaga;
                      Exit;
                   end else begin
                       if dtmRelDetalhes.QryPermissao.FieldbyName('FLGPROCURAR').AsInteger = 0 then begin
                          MsgDlg('Usuário ('+Sistema.NomeUsuario+') sem permissão de consulta a este tipo de regra.','Erro',mtError,[mbOK],0);
                          frmAguarde.Apaga;
                          Exit;
                       end;
                   end;
                   lstDados.Items.Add(ms4.ValoresChave[0]+'-'+ms4.ValoresChave[1]);
                   lstId.Items.Add(ms4.ValoresChave[0]);
                end;
           end;

  end;
end;

procedure TfrmParamRelatRegra.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  lstDados.Items.Clear;
  lstId.Items.Clear;
end;

procedure TfrmParamRelatRegra.FormShow(Sender: TObject);
begin
  inherited;
  lstDados.Items.Clear;
  lstId.Items.Clear;
  Case TipoRel of
       1 : begin
                vSql1 := 'SELECT F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, G.DESCGRUPOFORMULA '+
                         'FROM GRPFORMULA G, FORMULA F WHERE G.CODGRUPOFORMULA = F.CODGRUPOFORMULA '+
                         'ORDER BY G.DESCGRUPOFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL';
                dtmRelRegra.QryFormula.Close;
           end;
       2 : begin
                vSql2 := 'SELECT IDCAMPO, DESCRICAODOCAMPO FROM CMPBD WHERE CAMPODOBANCO = 0 ORDER BY IDCAMPO';
                dtmRelRegra.qryVariaveis.Close;
           end;
       3 : begin
                vSql3 := 'SELECT IDCAMPO, DESCRICAODOCAMPO,ENTIDADE,NOMEDOCAMPO FROM CMPBD '+
                         'WHERE CAMPODOBANCO > 0 ORDER BY ENTIDADE, NOMEDOCAMPO';
                dtmRelRegra.qryCampos.Close;
           end;
       4 : begin
                vSql4 := 'SELECT R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, A.IDALGORITMODAREG, '+
                         'A.DESCRICAOALGORIT FROM REGRA R, ALGREGRA A, TIPOREGRA T WHERE '+
                         'R.IDREGRA = A.IDREGRA AND T.IDTIPOREGRA = R.IDTIPOREGRA ORDER BY '+
                         'T.DESCREGRA, R.NOMEREGRA, R.IDREGRA, A.IDALGORITMODAREG';
                dtmRelRegra.QryRegras.Close;
           end;
  end;

end;

procedure TfrmParamRelatRegra.sbtnUmaUmClick(Sender: TObject);
var
   i : LongInt;
begin
  inherited;
  i := lstDados.ItemIndex;
  lstDados.Items.Delete(i);
  lstId.Items.Delete(i);
end;

procedure TfrmParamRelatRegra.FormCreate(Sender: TObject);
begin
  inherited;
  { Preenche o ususario do MontaSelect de pesquisa de Regras }
  MS4.Filtro.Add ('( GRUPOREGRAUSUARIO.IDUSUARIO = '+
                           IntToStr(Sistema.IdUsuario)+')');


  
end;

end.

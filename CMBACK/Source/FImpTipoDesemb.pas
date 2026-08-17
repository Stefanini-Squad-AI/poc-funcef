unit FImpTipoDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  wwdblook, Db, Wwdatsrc, DBTables, wwQuery, uSistema, uAutorizacao,
    uMensErro, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMTree;

type
  TFrmImpTipoDesemb = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    CmbTipoDesemb: TwwDBLookupCombo;
    qryTipoDesemb: TwwQuery;
    qryTipoDesembCODTIPRECDES: TStringField;
    qryTipoDesembRECPAG: TStringField;
    qryTipoDesembPLANO: TFloatField;
    qryTipoDesembPLACONTA: TStringField;
    qryTipoDesembIDPESSOA: TFloatField;
    qryTipoDesembDESCRICAO: TStringField;
    qryTipoDesembANASINT: TStringField;
    qryTipoDesembIDUSUARIOINCLUSAO: TFloatField;
    qryTipoDesembPLACONTACREDITO: TStringField;
    ds: TwwDataSource;
    Panel2: TPanel;
    treeDesemb: TCMTreeView;
    Panel3: TPanel;
    QryEmpresa: TwwQuery;
    QryImporta: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmbTipoDesembCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpTipoDesemb: TFrmImpTipoDesemb;

implementation

uses DBaseDados, uIntegraBack;

{$R *.DFM}

procedure TFrmImpTipoDesemb.FormCreate(Sender: TObject);
begin
  inherited;
        QryEmpresa.Sql.Text := 'SELECT E.NOMEEMPRESA, E.IDPESSOA, P.MASCARADESEMB, PC.PLANO ' +
                    ' FROM ' + Sistema.PrefixoServidor + 'EMPRESAPROP E, '
                             + Sistema.PrefixoServidor + 'PARAMCAP P, ' 
                             + Sistema.PrefixoServidor + 'PARAMCONTAB PC '+
                    'WHERE (E.IDPESSOA <> ' + IntToStr(Sistema.IdEmpresa) + ') AND ' +
                          '(P.RECPAG = ''' + IntegraBack.RecPag + ''') AND' +
                          '(E.IDPESSOA = PC.IDPESSOA(+)) AND ' +
                          '(E.IDPESSOA = P.IDPESSOA(+)) ' +
                    ' ORDER BY E.NOMEEMPRESA';
        QryEmpresa.Open;
end;

procedure TFrmImpTipoDesemb.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   Try
     If qryTipoDesemb.IsEmpty Then
     Begin
        Msgdlg('Não exitem Tipos Desembolso a serer Copiados','Aviso',mterror,[mbOk],0);
        Exit;
     End;

     If QryEmpresa.FieldByName('MASCARADESEMB').AsString <> IntegraBack.MascaraRecDes Then
     Begin
        Msgdlg('A máscara de Desembolso da Empresa de Origem é diferente','Aviso',mterror,[mbOk],0);
        Exit;
     End;

     If Sistema.ConectaRemoto Then
     Begin
        if not dtmBaseDados.dbBaseRemota.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;
        if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;
     End
     Else
        if not dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.StartTransaction;

     with qryTipoDesemb do
     begin
          First;
          While Not Eof Do
          Begin
               QryImporta.Close;


        If QryEmpresa.FieldByName('PLANO').AsInteger = IntegraBack.Plano Then
        Begin
               //Se Plano de Contas igual para as duas empresas, importa todos os dados
               QryImporta.Sql.Text := 'INSERT INTO ' + Sistema.PrefixoServidor + 'TIPORECEBDESEMB    '  +
                                      '(CODTIPRECDES, RECPAG, IDPESSOA, PLANO, PLACONTA,    '  +
                                      ' DESCRICAO,ANASINT,PLACONTACREDITO,IDUSUARIOINCLUSAO) ' +
                                      ' VALUES (' +
                                      '''' + FieldByName('CODTIPRECDES').AsString + ''',' +
                                      '''' + IntegraBack.RecPag + ''',' +
                                      IntToStr(Sistema.IdEmpresa) + ',' +
                                      FieldByName('PLANO').AsString + ',' +
                                      '''' + FieldByName('PLACONTA').AsString  + ''',' +
                                      '''' + FieldByName('DESCRICAO').AsString + ''',' +
                                      '''' + FieldByName('ANASINT').AsString   + ''',' +
                                      '''' + FieldByName('PLACONTACREDITO').AsString + ''',' +
                                      IntToStr(Sistema.IdUsuario) + ')';
        End
        Else
        Begin
               //Se Plano de Contas # ou nulo importa só os tipos de desembolso
               QryImporta.Sql.Text := 'INSERT INTO ' + Sistema.PrefixoServidor + 'TIPORECEBDESEMB    '  +
                                      '(CODTIPRECDES, RECPAG, IDPESSOA, '      +
                                      ' DESCRICAO,ANASINT,IDUSUARIOINCLUSAO) ' +
                                      ' VALUES (' +
                                      '''' + FieldByName('CODTIPRECDES').AsString + ''',' +
                                      '''' + IntegraBack.RecPag + ''',' +
                                      IntToStr(Sistema.IdEmpresa) + ',' +
                                      '''' + FieldByName('DESCRICAO').AsString + ''',' +
                                      '''' + FieldByName('ANASINT').AsString   + ''',' +
                                      IntToStr(Sistema.IdUsuario) + ')';
        End;
               QryImporta.ExecSql;
               Next;
          End;
     end;

     If Sistema.ConectaRemoto Then
     Begin
        if dtmBaseDados.dbBaseRemota.InTransaction then dtmBaseDados.dbBaseDados.Commit;
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
     End
     Else
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

     If QryEmpresa.FieldByName('PLANO').AsInteger <> IntegraBack.Plano Then
        Msgdlg('Tipos de Desembolso Copiados Com Sucesso, porém ' + (#13 + #10) +
        'Como O Plano Contábil da Empresa de Origem é diferente,  as contas' +
              (#13 + #10) + 'Contábeis e de Crédito não foram ser copiadas.',
              'Aviso',mtInformation,[mbOk],0)
     Else
        Msgdlg('Tipos de Desembolso Copiados Com Sucesso','Aviso',mtInformation,[mbOk],0);
     Close;
   Except
     If Sistema.ConectaRemoto Then
     Begin
        if dtmBaseDados.dbBaseRemota.InTransaction then dtmBaseDados.dbBaseDados.Rollback;
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;        
     End
     Else
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;

     Msgdlg('Não foi possível copiar tipos de desembolso','Aviso',mterror,[mbOk],0);
   End;
end;

procedure TFrmImpTipoDesemb.CmbTipoDesembCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

        If CmbTipoDesemb.Text = '' Then Exit;

        qryTipoDesemb.Close;
        qryTipoDesemb.Sql.Text := ' SELECT CODTIPRECDES, RECPAG, IDPESSOA, PLANO, ' +
                                          'PLACONTA, IDUSUARIOINCLUSAO, DESCRICAO, ' +
                                          'ANASINT, PLACONTACREDITO ' +
                    ' FROM '+ Sistema.PrefixoServidor +'TIPORECEBDESEMB'+
                    ' WHERE RECPAG = '''+ IntegraBack.RecPag +''''+
                    ' AND IDPESSOA = '+ QryEmpresa.FieldByName('IDPESSOA').AsString +
                    ' ORDER BY CODTIPRECDES';
        qryTipoDesemb.Open;
        treeDesemb.mascara := IntegraBack.MascaraRecDes;
        treeDesemb.MontaArvore;
        Panel2.Enabled := Not qryTipoDesemb.IsEmpty;

        If Not qryTipoDesemb.IsEmpty Then
        Begin
             If QryEmpresa.FieldByName('PLANO').AsInteger <> IntegraBack.Plano Then
                Msgdlg('O Plano Contábil da Empresa de Origem é diferente, caso' +
                      (#13 + #10) + 'estes Tipos de Desembolso sejam copiados, as contas ' +
                      (#13 + #10) + 'Contábeis e de Crédito não podem ser copiadas.',
                      'Aviso',mtWarning,[mbOk],0);

             If QryEmpresa.FieldByName('MASCARADESEMB').AsString <> IntegraBack.MascaraRecDes Then
                Msgdlg('A máscara de Desembolso da Empresa de Origem é diferente','Aviso',mtWarning,[mbOk],0);
        End;
end;

end.


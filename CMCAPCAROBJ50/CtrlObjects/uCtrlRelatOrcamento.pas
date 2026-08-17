 unit uCtrlRelatOrcamento;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider;

Type
  TCtrlRelatOrcamento = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function Suplemen(numalteracao, idpessoa: double) : OleVariant;

  end;

implementation


procedure TCtrlRelatOrcamento.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlRelatOrcamento.Create;
begin
  inherited;
  //
end;

destructor TCtrlRelatOrcamento.Destroy;
begin
  inherited;
  //
end;

function TCtrlRelatOrcamento.Suplemen(numalteracao, idpessoa: double) : OleVariant;
var sSQl : String;
begin
   sSql := 'SELECT                                                     ' +
           '   A.IDCONTAORIGEM, C1.NOMECONTAORCAMEN AS CONTAORI,       ' +
           '   A.OBSALTERORCAMEN, A.DATAREFERENCIA, A.NUMALTERACAO,    ' +
           '   CR.CODCENTRORESPON, CR.NOME, A.VLRSOLICITADO            ' +
           'FROM                                                       ' +
           '   ALTERORCAMENTO A, CENTRESPON CR, CONTASORCAMEN C1       ' +
           'WHERE                                                      ' +
           '   (A.FLGTIPOALTER = ''S'') AND                            ' +
           '   (A.IDCONTAORIGEM = C1.IDCONTAORCAMEN) AND               ' +
           '   (A.IDPLANOORCAMEN = C1.IDPLANOORCAMEN) AND              ' +
           '   (C1.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND        ' +
           '   (C1.IDPESSOA = CR.IDPESSOA(+))  AND                     ' +
           '   (A.NUMALTERACAO = ' + FloatToStr(numalteracao) + ') AND ' +
           '   (A.IDPESSOA = ' + FloatToStr(idpessoa) + ')';
   Result := GetDataPacket(sSql);
end;



end.


